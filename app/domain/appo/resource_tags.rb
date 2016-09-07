module Appo
class ResourceTags

  GRADE_LEVELS = [
    'Pre-K',
    'Kindergarten',
    '1st Grade',
    '2nd Grade',
    '3rd Grade',
    '4th Grade',
    '5th Grade',
    '6th Grade',
    '7th Grade',
    '8th Grade',
    '9th Grade',
    '10th Grade',
    '11th Grade',
    '12th Grade'
  ]

  GRADES = %w(Pre-K K 1st 2nd 3rd 4th 5th 6th 7th 8th 9th 10th 11th 12th)

  GRADE_MAPPING = {
    'Pre-K' => 'PreK',
    'K' => 'Kindergarten',
    '1st' => 'First',
    '2nd' => 'Second',
    '3rd' => 'Third',
    '4th' => 'Fourth',
    '5th' => 'Fifth',
    '6th' => 'Sixth',
    '7th' => 'Seventh',
    '8th' => 'Eighth',
    '9th' => 'Ninth',
    '10th' => 'Tenth',
    '11th' => 'Eleventh',
    '12th' => 'Twelfth'
  }

  SUBJECTS_AND_TOPICS = [

    { name: 'Art', topics: [
      'Music',
      'Visual Arts'
    ]},

    { name: 'Creative Expression', topics: [
      'Art Appreciation',
      'Audio Production',
      'Book Creation',
      'Brainstorming',
      'Digital Design',
      'Digital Development',
      'Digital Storytelling',
      'Drawing',
      'Multimedia Fluency',
      'Music',
      'Painting',
      'Photography',
      'Project Presentations',
      'Publishing',
      'Visual Production'
    ]},

    { name: 'English Language Arts', topics: [
      'ABCs',
      'American Literature',
      'Communication',
      'Composition',
      'Critical Reasoning',
      'Essay Writing',
      'Foundational Reading',
      'Grammar',
      'Handwriting',
      'Literary Themes',
      'Literature',
      'Literature Comprehension',
      'Multimedia Comprehension',
      'Mythology',
      'Narrative Development',
      'Phonics',
      'Poetry',
      'Public Speaking',
      'Reading Analysis',
      'Reading Comprehension',
      'Reference Guides',
      'Sentence Construction',
      'Shakespeare',
      'Speech',
      'Spelling',
      'Storytelling',
      'Term Papers',
      'Vocabulary',
      'Vocabulary Acquisition',
      'Vocabulary Retention',
      'World Literature',
      'Writing'
    ]},

    { name: 'Mathematics', topics: [
      'Addition',
      'Algebra',
      'Applied Measurement',
      'Applied Operations',
      'Calculus',
      'Counting',
      'Decision Making',
      'Division',
      'Fractions',
      'Fractions Operations',
      'Functions',
      'Geometric Concepts',
      'Geometric Measurement',
      'Geometry',
      'Linear Equations',
      'Logic',
      'Measurement',
      'Modeling',
      'Money',
      'Multiplication',
      'Number',
      'Number Sense',
      'Numeracy',
      'Operations',
      'Patterns',
      'Probability',
      'Problem Solving',
      'Proportional Relationships',
      'Pythagorean Theorem',
      'Quantity',
      'Ratios',
      'Shapes',
      'Statistics',
      'Subtraction',
      'Time',
      'Trigonometry',
      'Word Problems'
    ]},

    { name: 'Productivity', topics: [
      'Career Planning',
      'Collaboration Tools',
      'College Guides',
      'Flashcards',
      'Note-taking',
      'Organization',
      'Reasoning',
      'Reference Tools',
      'Scheduling',
      'Sequencing',
      'Sorting',
      'Standaridzed Test Prep',
      'Study Aids'
    ]},

    { name: 'Science', topics: [
      'Animals',
      'Behavioral Science',
      'Biology',
      'Chemistry',
      'Computer Science',
      'Earth',
      'Environmental Science',
      'Experimental Methods',
      'Health',
      'Human Body',
      'Life Science',
      'Physical Science',
      'Physics',
      'Plants',
      'Science Fair Projects',
      'Space'
    ]},

    { name: 'Social Studies', topics: [
      'Civics',
      'Current Events',
      'Emotional Learning',
      'European History',
      'Geography',
      'Government',
      'Political Science',
      'Religions',
      'Social Learning',
      'U.S. History',
      'Western Civilization',
      'World Cultures'
    ]},

    { name: 'World Languages', topics: [
      'French',
      'Spanish'
    ]}

  ]


  SUBJECTS = SUBJECTS_AND_TOPICS.map{|s| s.fetch(:name)}

  TOPICS = SUBJECTS_AND_TOPICS.flat_map{|s| s.fetch(:topics)}.uniq.sort

end
end
