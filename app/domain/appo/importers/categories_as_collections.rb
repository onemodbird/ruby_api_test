module Appo
module Importers
class CategoriesAsCollections

  def self.prepare_for_import!
    # resources having visibility != 'public' cause the import to take
    # much longer, so first find all the affected resources and make them
    # public.

    Resource
    .where("imported_data ? 'app_reviews'")
    .find_each(batch_size: 100) do |r|
      next if r.visibility == 'public'
      r.update_attributes! visibility: 'public'
    end
  end

  def self.import!
    new.import!
  end

  def import!
    shuffled_collections = collections.shuffle
    collaborators = {}

    kv = KeyValue.imported_collections
    kv.value['collection_id__to__collaborator_ids'] = {}
    kv.save!

    shuffled_collections.each do |collection|
      Collection.transaction do
        collaborator_ids = collection.delete(:collaborator_ids)
        category_id = collection.delete(:category_id)

        c = Collection.create! collection
        collaborators[c.id] = { category_id => collaborator_ids }

        kv.value['collection_id__to__collaborator_ids'] = collaborators
        kv.save!
      end
    end
  end

  def resource_data
    Resource.pluck(%[
      id,
      jsonb_array_elements(imported_data->'app_reviews')->'category_id' category_id,
      jsonb_array_elements(imported_data->'app_reviews')->'data_source' data_source,
      jsonb_array_elements(imported_data->'app_reviews')->'reviewer'->'email' email
    ])
  end

  def categories
    categories = {}
    resource_data.each do |row|
      id, category_id, data_source, email = row
      if 263 == category_id
        category_id = { 'net' => -1, 'edu' => -2 }.fetch(data_source)
      end
      categories[category_id] ||= []
      categories[category_id] << row
    end
    categories
  end

  def collections
    categories.map do |category_id, resources|
      emails = resources.map(&:fourth)
      user_ids = emails.map{|e| user_email_to_id(e) }
      {
        user_id: most_contributing_user_id(user_ids),
        name: find_category(category_id).first,
        tags: tags(category_id),
        resources: resources.map{ |r| { id: r.first } }.uniq,
        collaborator_ids: user_ids.uniq,
        category_id: category_id
      }
    end
  end

  def tags category_id
    name, tag2 = find_category(category_id)
    words = name.split(' ')
    if %w(Kindergarten Testing).include?(words.first)
      tag1 = words.take(1).join(' ')
      tag3 = words.drop(1).join(' ')
    else
      tag1 = words.take(2).join(' ')
      tag3 = words.drop(2).join(' ')
    end
    [tag1, tag2, tag3]
  end

  def find_category category_id
    data = category_data[category_id]
    data = older_category_data.fetch(category_id) unless data
    data
  end

  def most_contributing_user_id collaborator_ids
    collaborator_ids.reduce({}) do |h, id|
      h[id] ||= 0
      h[id] += 1
      h
    end.to_a.sort_by(&:last).reverse.first.first
  end

  def user_email_to_id email
    @email_to_id ||=
      begin
        User.pluck(:email, :id).to_h.tap do |h|
          h.delete(nil)
        end
      end
    @email_to_id.fetch(map_email(email))
  end

  def map_email email
    @map_email ||= {
      'abbynowakowski@gmail.com' => 'abbylease14@gmail.com'
    }
    @map_email.fetch(email, email)
  end

  def category_data
    @category_data ||= {
      51 => ['Early Childhood Writing & Handwriting', 'English & Language Arts'],
      52 => ['Early Childhood Reading', 'English & Language Arts'],
      53 => ['Early Childhood Speaking & Listening', 'English & Language Arts'],
      117 => ['Early Childhood ABCs & Phonics', 'English & Language Arts'],
      59 => ['Early Childhood Social Awareness', 'Social & Emotional Learning'],
      60 => ['Early Childhood Social Interaction', 'Social & Emotional Learning'],
      54 => ['Early Childhood Number Sense', 'Mathematics'],
      55 => ['Early Childhood Classification and Patterning', 'Mathematics'],
      56 => ['Early Childhood Measurement & Telling Time', 'Mathematics'],
      57 => ['Early Childhood Physical Science', 'Science'],
      58 => ['Early Childhood Life Science', 'Science'],
      136 => ['Early Childhood Toddler Exploration', 'Creative Expression'],
      158 => ['Early Childhood Sound & Creativity', 'Creative Expression'],
      185 => ['Early Childhood Digital Storytelling', 'Creative Expression'],
      140 => ['Early Childhood Sorting', 'Thinking & Organization'],
      141 => ['Early Childhood Reasoning', 'Thinking & Organization'],
      142 => ['Early Childhood Sequencing', 'Thinking & Organization'],
      31 => ['Elementary School Reading & Books', 'English & Language Arts'],
      32 => ['Elementary School Writing & Storytelling', 'English & Language Arts'],
      33 => ['Elementary School Reference', 'English & Language Arts'],
      157 => ['Elementary School Grammar', 'English & Language Arts'],
      196 => ['Elementary School Vocabulary Acquisition', 'English & Language Arts'],
      264 => ['Elementary School Spelling', 'English & Language Arts'],
      42 => ['Elementary School History', 'Social Studies'],
      44 => ['Elementary School Geography', 'Social Studies'],
      213 => ['Elementary School Current Events', 'Social Studies'],
      36 => ['Elementary School Fractions & Decimals', 'Mathematics'],
      37 => ['Elementary School Measurement, Money & Time', 'Mathematics'],
      116 => ['Elementary School Number Sense', 'Mathematics'],
      170 => ['Elementary School Spatial Reasoning', 'Mathematics'],
      38 => ['Elementary School Physical Science', 'Science'],
      39 => ['Elementary School Life Science', 'Science'],
      46 => ['Elementary School French', 'World Languages'],
      47 => ['Elementary School Spanish', 'World Languages'],
      249 => ['Elementary School Scheduling & Organization', 'Productivity'],
      251 => ['Elementary School Study Aids & Flashcards', 'Productivity'],
      242 => ['Elementary School Creativity Tools', 'Creative Expression'],
      241 => ['Elementary School Presentation Tools', 'Creative Expression'],
      70 => ['Middle School Reading Comprehension', 'English & Language Arts'],
      71 => ['Middle School Writing & Composition', 'English & Language Arts'],
      73 => ['Middle School Speaking & Listening', 'English & Language Arts'],
      155 => ['Middle School Grammar', 'English & Language Arts'],
      233 => ['Middle School Spelling', 'English & Language Arts'],
      81 => ['Middle School U.S. History', 'Social Studies'],
      82 => ['Middle School Civics & Government', 'Social Studies'],
      202 => ['Middle School World History', 'Social Studies'],
      74 => ['Middle School Numeracy', 'Mathematics'],
      75 => ['Middle School Geometry & Measurement', 'Mathematics'],
      77 => ['Middle School Algebra', 'Mathematics'],
      118 => ['Middle School Fractions & Decimals', 'Mathematics'],
      78 => ['Middle School Physical Science', 'Science'],
      79 => ['Middle School Life Science', 'Science'],
      152 => ['Middle School Astronomy', 'Science'],
      85 => ['Middle School Spanish', 'World Languages'],
      86 => ['Middle School French', 'World Languages'],
      226 => ['Middle School Presentation Tools', 'Creative Expression'],
      218 => ['Middle School Photography', 'Creative Expression'],
      209 => ['Middle School Scheduling & Organization', 'Productivity'],
      221 => ['Middle School Study Aids & Flashcards', 'Productivity'],
      89 => ['High School Reading & Literature', 'English & Language Arts'],
      90 => ['High School Writing & Composition', 'English & Language Arts'],
      91 => ['High School Speaking & Communication', 'English & Language Arts'],
      103 => ['High School U.S. History', 'Social Studies'],
      104 => ['High School World History', 'Social Studies'],
      -1 => ['High School World Cultures', 'Social Studies'],
      96 => ['High School Geometry', 'Mathematics'],
      97 => ['High School Algebra', 'Mathematics'],
      98 => ['High School Statistics & Probability', 'Mathematics'],
      99 => ['High School Trigonometry', 'Mathematics'],
      112 => ['High School Calculus', 'Mathematics'],
      100 => ['High School Physics & Physical Science', 'Science'],
      101 => ['High School Chemistry', 'Science'],
      102 => ['High School Biology & Life Science', 'Science'],
      120 => ['High School Computer Science & Technology', 'Science'],
      106 => ['High School French', 'World Languages'],
      107 => ['High School Spanish', 'World Languages'],
      126 => ['High School Latin', 'World Languages'],
      240 => ['High School Scheduling & Organization', 'Productivity'],
      235 => ['High School Study Aids & Flashcards', 'Productivity'],
      230 => ['High School Audio & Video Production', 'Creative Expression'],
      161 => ['High School Project Presentations', 'Creative Expression'],
      269 => ['Kindergarten Number Sense & Counting', 'Mathematics'],
      270 => ['Kindergarten Addition & Subtraction', 'Mathematics'],
      271 => ['Kindergarten Money & Measurement', 'Mathematics'],
      272 => ['Kindergarten Speech & Communication', 'English Language Arts'],
      273 => ['Kindergarten ABCs & Phonics', 'English Language Arts'],
      274 => ['Kindergarten Writing & Handwriting', 'English Language Arts'],
      275 => ['Kindergarten Plants & Animals', 'Science'],
      276 => ['Kindergarten Social & Emotional Learning', 'Social Studies'],
      277 => ['Kindergarten Painting & Drawing', 'Creative Expression'],
      278 => ['Kindergarten Sorting', 'Productivity'],
      279 => ['First Grade Operations (addition & subtraction)', 'Mathematics'],
      280 => ['First Grade Time, Money & Measurement', 'Mathematics'],
      281 => ['First Grade Shapes & Patterns', 'Mathematics'],
      282 => ['First Grade Foundational Reading', 'English Language Arts'],
      283 => ['First Grade Vocabulary Acquisition', 'English Language Arts'],
      284 => ['First Grade Spelling', 'English Language Arts'],
      285 => ['First Grade Earth & Space', 'Science'],
      286 => ['First Grade U.S. History and Geography', 'Social Studies'],
      402 => ['First Grade Music', 'Creative Expression'],
      288 => ['First Grade Reasoning', 'Productivity'],
      289 => ['Second Grade Operations (multiplication)', 'Mathematics'],
      290 => ['Second Grade Problem Solving', 'Mathematics'],
      291 => ['Second Grade Applied Measurement', 'Mathematics'],
      292 => ['Second Grade Reading Comprehension', 'English Language Arts'],
      293 => ['Second Grade Critical Reasoning', 'English Language Arts'],
      294 => ['Second Grade Spelling & Grammar', 'English Language Arts'],
      295 => ['Second Grade Health & Human Body', 'Science'],
      296 => ['Second Grade World Cultures', 'Social Studies'],
      297 => ['Second Grade Digital Storytelling', 'Creative Expression'],
      298 => ['Second Grade Sequencing', 'Productivity'],
      299 => ['Third Grade Operations (division)', 'Mathematics'],
      300 => ['Third Grade Fractions', 'Mathematics'],
      301 => ['Third Grade Geometric Measurement', 'Mathematics'],
      302 => ['Third Grade Literature & Poetry', 'English Language Arts'],
      303 => ['Third Grade Vocabulary Acquisition & Retention', 'English Language Arts'],
      304 => ['Third Grade Spelling & Sentence Construction', 'English Language Arts'],
      305 => ['Third Grade Physical Science', 'Science'],
      306 => ['Third Grade Current Events', 'Social Studies'],
      307 => ['Third Grade Art Appreciation', 'Art/Creative Expression'],
      308 => ['Third Grade Flashcards', 'Productivity'],
      310 => ['Fourth Grade Operations (addition, subtraction, multiplication, division)', 'Mathematics'],
      311 => ['Fourth Grade Fractions & Decimals', 'Mathematics'],
      312 => ['Fourth Grade Geometric Concepts', 'Mathematics'],
      313 => ['Fourth Grade Literary Themes', 'English Language Arts'],
      314 => ['Fourth Grade Writing & Composition', 'English Language Arts'],
      315 => ['Fourth Grade Spelling, Grammar & Vocabulary', 'English Language Arts'],
      316 => ['Fourth Grade Life Science', 'Science'],
      317 => ['Fourth Grade Civics', 'Social Studies'],
      320 => ['Fourth Grade Project Presentations', 'Creative Expression'],
      319 => ['Fourth Grade Scheduling & Organization', 'Productivity'],
      321 => ['Fifth Grade Fractions Operations', 'Mathematics'],
      322 => ['Fifth Grade Geometric Measurement & Concepts', 'Mathematics'],
      323 => ['Fifth Grade Logic & Problem Solving', 'Mathematics'],
      324 => ['Fifth Grade Reading & Comprehension', 'English Language Arts'],
      325 => ['Fifth Grade Writing & Storytelling', 'English Language Arts'],
      326 => ['Fifth Grade Spelling & Grammar', 'English Language Arts'],
      327 => ['Fifth Grade Geography', 'Social Studies'],
      328 => ['Fifth Grade Environmental Science', 'Science'],
      329 => ['Fifth Grade Brainstorming', 'Creative Expression'],
      330 => ['Fifth Grade Note-taking', 'Productivity'],
      331 => ['Sixth Grade Ratios & Proportional Relationships', 'Mathematics'],
      332 => ['Sixth Grade Applied Operations & Word Problems', 'Mathematics'],
      333 => ['Sixth Grade Statistics & Probability', 'Mathematics'],
      334 => ['Sixth Grade Literature & Mythology', 'English Language Arts'],
      335 => ['Sixth Grade Writing & Narrative Development', 'English Language Arts'],
      336 => ['Sixth Grade Sentence Construction', 'English Language Arts'],
      337 => ['Sixth Grade World Cultures & Religions', 'Social Studies'],
      339 => ['Sixth Grade Computer Science', 'Science'],
      340 => ['Sixth Grade Speech and Public Presentations', 'Creative Expression'],
      341 => ['Sixth Grade Study Aids & Flashcards', 'Productivity'],
      342 => ['Seventh Grade Operations & Algebraic Thinking', 'Mathematics'],
      343 => ['Seventh Grade Applied Geometry', 'Mathematics'],
      344 => ['Seventh Grade Literature Comprehension', 'English Language Arts'],
      345 => ['Seventh Grade Essay Writing', 'English Language Arts'],
      346 => ['Seventh Grade Civics & Government', 'Social Studies'],
      347 => ['Seventh Grade Health & Behavioral Science', 'Science'],
      348 => ['Seventh Grade Publishing & Book Creation', 'Creative Expression'],
      349 => ['Seventh Grade Reference Tools', 'Productivity'],
      350 => ['Seventh Grade Visual Arts', 'Art'],
      351 => ['Seventh Grade Spanish & French', 'World Languages'],
      352 => ['Eighth Grade Algebra & Linear Equations', 'Mathematics'],
      353 => ['Eighth Grade Geometry & Pythagorean Theorem', 'Mathematics'],
      354 => ['Eighth Grade Reading & Multimedia Comprehension', 'English Language Arts'],
      355 => ['Eighth Grade Essay Writing & Narrative Development', 'English Language Arts'],
      356 => ['Eighth Grade U.S. History', 'Social Studies'],
      357 => ['Eighth Grade Astronomy', 'Science'],
      358 => ['Eighth Grade Photography', 'Creative Expression'],
      359 => ['Eighth Grade Scheduling & Organization', 'Productivity'],
      403 => ['Eighth Grade Music', 'Art'],
      361 => ['Eighth Grade Spanish & French', 'World Languages'],
      362 => ['Ninth Grade Algebra', 'Mathematics'],
      363 => ['Ninth Grade Number & Quantity', 'Mathematics'],
      364 => ['Ninth Grade Reading Analysis', 'English Language Arts'],
      365 => ['Ninth Grade Mythology', 'English Language Arts'],
      366 => ['Ninth Grade Western Civilization', 'Social Studies'],
      367 => ['Ninth Grade Physical Science', 'Science'],
      368 => ['Ninth Grade Multimedia Fluency', 'Creative Expression'],
      369 => ['Ninth Grade Collaboration Tools', 'Productivity'],
      370 => ['Ninth Grade Spanish', 'World Languages'],
      371 => ['Ninth Grade French', 'World Languages'],
      372 => ['Tenth Grade Geometry', 'Mathematics'],
      373 => ['Tenth Grade Modeling & Decision-Making', 'Mathematics'],
      374 => ['Tenth Grade Shakespeare', 'English Language Arts'],
      375 => ['Tenth Grade Writing & Term Papers', 'English Language Arts'],
      376 => ['Tenth Grade U.S. History', 'Social Studies'],
      377 => ['Tenth Grade Biology', 'Science'],
      378 => ['Tenth Grade French', 'World Languages'],
      379 => ['Tenth Grade Spanish', 'World Languages'],
      380 => ['Tenth Grade Audio & Visual Production', 'Creative Expression'],
      404 => ['Tenth Grade Study Aids, Flashcards & Note-taking', 'Productivity'],
      382 => ['Eleventh Grade Statistics & Probability', 'Mathematics'],
      383 => ['Eleventh Grade Functions', 'Mathematics'],
      384 => ['Eleventh Grade American Literature', 'English Language Arts'],
      385 => ['Eleventh Grade Reference Guides', 'English Language Arts'],
      386 => ['Eleventh Grade European History', 'Social Studies'],
      387 => ['Eleventh Grade Chemistry', 'Science'],
      388 => ['Eleventh Grade Spanish', 'World Languages'],
      389 => ['Eleventh Grade French', 'World Languages'],
      390 => ['Eleventh Grade Digital Design & Development', 'Creative Expression'],
      391 => ['Eleventh Grade Standardized Test Prep', 'Productivity & Planning'],
      392 => ['Twelfth Grade Calculus', 'Mathematics'],
      393 => ['Twelfth Grade Trigonometry', 'Mathematics'],
      394 => ['Twelfth Grade World Literature', 'English Language Arts'],
      395 => ['Twelfth Grade Public Speaking & Communication', 'English Language Arts'],
      396 => ['Twelfth Grade Political Science & Current Events', 'Social Studies'],
      397 => ['Twelfth Grade Physics', 'Science'],
      398 => ['Twelfth Grade Spanish', 'World Languages'],
      399 => ['Twelfth Grade French', 'World Languages'],
      400 => ['Twelfth Grade Project Presentations', 'Creative Expression'],
      401 => ['Twelfth Grade College Guides & Career Planning', 'Productivity & Planning'],
      405 => ['Special Education Pre-K - 5th Grade', 'Autism'],
      407 => ['Special Education 6th Grade - 12th Grade', 'Autism'],
      408 => ['Special Education Pre-K - 5th Grade', 'Speech & Language Therapy'],
      409 => ['Special Education 6th Grade - 12th Grade', 'Speech & Language Therapy'],
      414 => ['Special Education PreK - 5th Grade', 'Dyslexia'],
      415 => ['Special Education 6th Grade - 12th Grade', 'Dyslexia'],
      416 => ['Special Education PreK - 5th Grade', 'Attention Deficit Disorder'],
      417 => ['Special Education 6th Grade - 12th Grade', 'Attention Deficit Disorder'],
      410 => ['Testing High School', 'Standardized Testing'],
      419 => ['Testing The SAT', 'Standardized Testing'],
      420 => ['Testing The ACT Test', 'Standardized Testing']
    }
  end

  def older_category_data
    @older_category_data ||= {
      30 => ['Elementary School Phonics & ABCs', 'English & Language Arts'],
      31 => ['Elementary School Reading & Books', 'English & Language Arts'],
      32 => ['Elementary School Writing & Storytelling', 'English & Language Arts'],
      33 => ['Elementary School Reference', 'English & Language Arts'],
      34 => ['Elementary School Operations', 'Math'],
      36 => ['Elementary School Fractions & Decimals', 'Math'],
      37 => ['Elementary School Money & Measurement', 'Math'],
      38 => ['Elementary School Physical Science', 'Science'],
      39 => ['Elementary School Life Science', 'Science'],
      41 => ['Elementary School Computer Science/Technology', 'Science'],
      42 => ['Elementary School History', 'Social Studies'],
      43 => ['Elementary School Civics & Government', 'Social Studies'],
      44 => ['Elementary School Geography', 'Social Studies'],
      46 => ['Elementary School French', 'World Languages'],
      47 => ['Elementary School Spanish', 'World Languages'],
      49 => ['Elementary School Visual Arts', 'Art & Music'],
      50 => ['Elementary School Music & Dance', 'Art & Music'],
      51 => ['Early Childhood Writing & Handwriting', 'English & Language Arts'],
      52 => ['Early Childhood Reading', 'English & Language Arts'],
      53 => ['Early Childhood Speaking & Listening', 'English & Language Arts'],
      54 => ['Early Childhood Number Sense', 'Mathematics'],
      55 => ['Early Childhood Classification and Patterning', 'Mathematics'],
      56 => ['Early Childhood Measurement & Telling Time', 'Mathematics'],
      57 => ['Early Childhood Physical Science', 'Science'],
      58 => ['Early Childhood Life Science', 'Science'],
      59 => ['Early Childhood Self Awareness', 'Social & Emotional Learning'],
      60 => ['Early Childhood Social Interaction', 'Social & Emotional Learning'],
      61 => ['Early Childhood Spanish', 'World Languages'],
      62 => ['Early Childhood French', 'World Languages'],
      63 => ['Early Childhood Music', 'Fine Arts'],
      64 => ['Early Childhood Visual Arts', 'Fine Arts'],
      65 => ['Early Childhood Exercise', 'Health'],
      66 => ['Early Childhood Human Body', 'Health'],
      69 => ['Middle School Visual Arts', 'Fine Arts'],
      70 => ['Middle School Reading', 'English & Language Arts'],
      71 => ['Middle School Writing & Composition', 'English & Language Arts'],
      73 => ['Middle School Speaking & Listening', 'English & Language Arts'],
      74 => ['Middle School Numeracy', 'Mathematics'],
      75 => ['Middle School Geometry & Measurement', 'Mathematics'],
      76 => ['Middle School Data, Statistics and Probability', 'Mathematics'],
      77 => ['Middle School Algebra', 'Mathematics'],
      78 => ['Middle School Physical Science', 'Science'],
      79 => ['Middle School Life Science', 'Science'],
      80 => ['Middle School Earth and Space', 'Science'],
      81 => ['Middle School U.S. History', 'Social Studies'],
      82 => ['Middle School Civics & Government', 'Social Studies'],
      83 => ['Middle School Geography', 'Social Studies'],
      85 => ['Middle School Spanish', 'World Languages'],
      86 => ['Middle School French', 'World Languages'],
      88 => ['Middle School Life Skills', 'Special Needs'],
      89 => ['High School Reading & Literature', 'English & Language Arts'],
      90 => ['High School Writing & Composition', 'English & Language Arts'],
      91 => ['High School Communication & Speaking', 'English & Language Arts'],
      94 => ['High School Visual Arts', 'Fine Arts'],
      96 => ['High School Geometry', 'Mathematics'],
      97 => ['High School Algebra', 'Mathematics'],
      98 => ['High School Statistics & Probability', 'Mathematics'],
      99 => ['High School Trigonometry', 'Mathematics'],
      100 => ['High School Physics & Physical Science', 'Science'],
      101 => ['High School Chemistry', 'Science'],
      102 => ['High School Biology & Life Science', 'Science'],
      103 => ['High School U.S. History', 'Social Studies'],
      104 => ['High School World History', 'Social Studies'],
      105 => ['High School Civics & Government', 'Social Studies'],
      106 => ['High School French', 'World Languages'],
      107 => ['High School Spanish', 'World Languages'],
      110 => ['High School Classroom Skills', 'Special Needs'],
      111 => ['High School Earth & Space', 'Science'],
      112 => ['High School Calculus', 'Mathematics'],
      113 => ['Elementary School English as a Second Language', 'World Languages'],
      114 => ['Early Childhood Classroom Skills', 'Special Needs'],
      115 => ['Early Childhood Life Skills', 'Special Needs'],
      116 => ['Elementary School Number Sense', 'Math'],
      117 => ['Early Childhood ABCs & Phonics', 'English & Language Arts'],
      118 => ['Middle School Fractions & Decimals', 'Mathematics'],
      119 => ['Middle School Computer Science & Technology', 'Science'],
      120 => ['High School Computer Science & Technology', 'Science'],
      121 => ['Middle School Classroom Skills', 'Special Needs'],
      122 => ['Elementary School Classroom Skills', 'Special Needs'],
      123 => ['Elementary School Life Skills', 'Special Needs'],
      124 => ['High School Life Skills', 'Special Needs'],
      125 => ['Middle School Latin', 'World Languages'],
      126 => ['High School Latin', 'World Languages'],
      132 => ['Early Childhood Autism', 'Special Needs'],
      133 => ['Early Childhood Interactive Books', 'English & Language Arts'],
      136 => ['Early Childhood Toddler Exploration', 'Creative Expression'],
      137 => ['Early Childhood Creation', 'Creative Expression'],
      140 => ['Early Childhood Sorting', 'Thinking & Organization'],
      141 => ['Early Childhood Reasoning', 'Thinking & Organization'],
      142 => ['Early Childhood Sequencing', 'Thinking & Organization'],
      147 => ['Elementary School Exercise & Nutrition', 'Health'],
      148 => ['Elementary School Human Body', 'Health'],
      149 => ['Elementary School Audio & Video Production', 'Creative Expression'],
      152 => ['Middle School Astronomy', 'Science'],
      153 => ['Middle School Geology', 'Science'],
      154 => ['Middle School Meteorology', 'Science'],
      155 => ['Middle School Grammar', 'English & Language Arts'],
      157 => ['Elementary School Grammar', 'English & Language Arts'],
      158 => ['Early Childhood Sound & Creativity', 'Creative Expression'],
      159 => ['Early Childhood Speech & Language Therapy', 'Special Needs'],
      160 => ['High School Exercise & Nutrition', 'Health'],
      161 => ['High School Project Presentations', 'Creative Expression'],
      164 => ['Elementary School Speech & Language Therapy', 'Special Needs'],
      166 => ['Middle School Brainstorming', 'Creative Expression'],
      168 => ['High School Economics', 'Social Studies'],
      169 => ['High School Engineering', 'Science'],
      170 => ['Elementary School Spatial Reasoning', 'Math'],
      173 => ['Middle School Engineering', 'Science'],
      176 => ['Elementary School Environmental Science', 'Science'],
      177 => ['Middle School Storytelling & Book Creation', 'Creative Expression'],
      178 => ['High School English as a Second Language', 'World Languages'],
      179 => ['Elementary School Geometry', 'Math'],
      185 => ['Early Childhood Digital Storytelling', 'Creative Expression'],
      187 => ['Elementary School Autism', 'Special Needs'],
      188 => ['Elementary School Social Interaction', 'Social & Emotional Learning'],
      190 => ['Elementary School U.S. History', 'Social Studies'],
      191 => ['High School Italian', 'World Languages'],
      192 => ['Middle School Logic & Creative Problem Solving', 'Mathematics'],
      193 => ['Elementary School Interactive Books', 'English & Language Arts'],
      196 => ['Elementary School Vocabulary Acquisition', 'English & Language Arts'],
      197 => ['Elementary School Attention Deficit Disorder', 'Special Needs'],
      200 => ['High School Speech & Language Therapy', 'Special Needs'],
      201 => ['High School Music', 'Fine Arts'],
      202 => ['Middle School World History', 'Social Studies'],
      206 => ['High School Geography', 'Social Studies'],
      207 => ['High School Mythology', 'English & Language Arts'],
      208 => ['Elementary School Browsers', 'Productivity'],
      209 => ['Middle School Scheduling & Organization', 'Productivity'],
      210 => ['High School College Guides', 'College Prep'],
      211 => ['High School Standardized Test Prep', 'College Prep'],
      213 => ['Elementary School Current Events', 'Social Studies'],
      214 => ['Middle School Current Events', 'Social Studies'],
      215 => ['High School Astronomy', 'Science'],
      216 => ['High School Religious Studies', 'Social Studies'],
      217 => ['Middle School Music', 'Fine Arts'],
      218 => ['Middle School Photography', 'Creative Expression'],
      219 => ['Middle School Autism', 'Special Needs'],
      220 => ['Early Childhood English as a Second Language', 'World Languages'],
      223 => ['High School Literary Classics', 'English & Language Arts'],
      225 => ['High School Web Design', 'Creative Expression'],
      226 => ['Middle School Presentation Tools', 'Creative Expression'],
      227 => ['Elementary School Publishing & Book Creation', 'Creative Expression'],
      228 => ['High School Photography', 'Creative Expression'],
      229 => ['High School Publishing & Book Creation', 'Creative Expression'],
      230 => ['High School Audio & Video Production', 'Creative Expression'],
      232 => ['Elementary School Photography', 'Creative Expression'],
      233 => ['Middle School Spelling', 'English & Language Arts'],
      234 => ['High School Reference', 'English & Language Arts'],
      235 => ['High School Flashcards', 'Productivity'],
      236 => ['High School Autism', 'Special Needs'],
      238 => ['Middle School Flashcards', 'Productivity'],
      240 => ['High School Scheduling & Organization', 'Productivity'],
      241 => ['Elementary School Presentation Tools', 'Creative Expression'],
      242 => ['Elementary School Creativity Tools', 'Creative Expression'],
      244 => ['Middle School Audio & Video Production', 'Creative Expression'],
      245 => ['Middle School Reference', 'English & Language Arts'],
      248 => ['Elementary School Flashcards', 'Productivity'],
      249 => ['Elementary School Scheduling & Organization', 'Productivity'],
      250 => ['High School Note-Taking', 'Productivity'],
      251 => ['Elementary School Study Aids', 'Productivity'],
      252 => ['Elementary School Note-Taking', 'Productivity'],
      253 => ['Elementary School World Cultures', 'Social Studies'],
      254 => ['Middle School Dyslexia', 'Special Needs'],
      255 => ['Elementary School Telling Time', 'Math'],
      256 => ['High School ACT Prep', 'College Prep'],
      258 => ['Early Childhood World Cultures', 'World Languages'],
      259 => ['Elementary School Dyslexia', 'Special Needs'],
      -2  => ['Middle School Word Problems', 'Mathematics'],
      266 => ['Elementary School Spelling', 'English & Language Arts'],
      267 => ['High School World Cultures', 'Social Studies']
    }
  end

end
end
end
