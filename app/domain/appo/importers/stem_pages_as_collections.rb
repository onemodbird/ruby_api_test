module Appo
module Importers
class StemPagesAsCollections

  def self.import!
    new.import!
  end

  def import!
    Collection.transaction do
      collection_ids = []
      collections.shuffle.each do |collection|
        resources_to_update = collection.delete(:resources_to_update)
        resources_to_update.each(&:save!)

        c = Collection.create! collection
        collection_ids << c.id
      end

      kv = KeyValue.imported_collections
      kv.update_attributes!(
        value: kv.value.merge({ 'stem_page_collection_ids' => collection_ids })
      )
    end
  end

  def stem_page_resources
    Resource.where(
      %(imported_data ?| array['stem_apps','stem_videos','stem_websites'])
    )
  end

  def stem_pages
    @stem_pages ||=
      begin
        stem_pages = {}
        stem_page_resources.each do |r|
          d = r.imported_data
          stem_resources =
            d.fetch('stem_apps', []) +
            d.fetch('stem_videos', []) +
            d.fetch('stem_websites', [])

          stem_resources.each do |si|
            stem_page_id = si.fetch('stem_page_id')
            stem_pages[stem_page_id] ||= []
            stem_pages[stem_page_id] << [r, si.fetch('description')]
          end
        end
        stem_pages
      end
  end

  def collections
    stem_pages.map do |stem_page_id, resources|
      resources_to_update = []

      {
        user_id: user_id(stem_page_id),
        name: stem_page_names.fetch(stem_page_id),
        description: stem_page_descriptions.fetch(stem_page_id),
        tags: ['STEM'],
        resources: resources.map{ |r, comment|
          if r.lede.present? && comment != r.lede
            { id: r.id, comment: comment }
          elsif r.lede.present?
            { id: r.id }
          else
            r.lede = comment
            resources_to_update << r
            { id: r.id }
          end
        }.uniq{ |h| h.first },
        resources_to_update: resources_to_update
      }
    end
  end

  def user_id stem_page_id
    user_email = stem_page_user_emails.fetch(stem_page_id)
    user_ids.fetch(user_email)
  end

  def stem_page_names
    {
      1 => 'Robotics',
      2 => 'Drones',
      3 => '3D Printing',
      4 => 'Space Travel',
      5 => 'Forensics',
      6 => 'App Development',
      7 => 'Animation',
      8 => 'Cloning',
      9 => 'Weather Prediction and Climate Change',
      10 => 'Data Security',
      11 => 'Data Mining',
      12 => 'Coding',
      13 => 'Video Game Development',
      14 => 'Artificial Intelligence',
      15 => 'Digital Media Compression',
      16 => 'Petroleum Engineering',
      17 => 'Augmented Reality',
      18 => 'Biodiversity',
      19 => 'Hardware Engineering',
      20 => 'Financial Technology'
    }
  end

  def stem_page_user_emails
    {
      1 => 'julie.willcott@staff.foxcroftacademy.org',
      2 => 'keith@keithgeorge.net',
      3 => 'johncork@panyarathighschool.ac.th',
      4 => 'msammartano@mamkschools.org',
      5 => 'julie.willcott@staff.foxcroftacademy.org',
      6 => 'johncork@panyarathighschool.ac.th',
      7 => 'leahlacrosse@gmail.com',
      8 => 'keith@keithgeorge.net',
      9 => 'msammartano@mamkschools.org',
      10 => 'jamessayer@gmail.com',
      11 => 'jamessayer@gmail.com',
      12 => 'jamessayer@gmail.com',
      13 => 'johncork@panyarathighschool.ac.th',
      14 => 'johncork@panyarathighschool.ac.th',
      15 => 'jamessayer@gmail.com',
      16 => 'keith@keithgeorge.net',
      17 => 'classtechtips@gmail.com',
      18 => 'classtechtips@gmail.com',
      19 => 'keith@keithgeorge.net',
      20 => 'jamessayer@gmail.com'
    }
  end

  def user_ids
    @user_ids ||=
      User
        .where(email: stem_page_user_emails.values.uniq)
        .map{|u| [u.email, u.id]}
        .to_h
  end

  def stem_page_descriptions
    {
      1 => "Robotics involves using a combination of computer science and engineering skills to design, construct, and operate a robot. What is a robot? A robot is a machine that can carry out complex actions.  Robots can perform defined, predictable actions or can be programmed to respond to their environment.\r\n\r\nRobotics is part of the Do––Yourself (DIY) maker movement that is engaging students around the world. It provides students with challenges and excitement. Robotics can be incorporated into math, science, and computer technology courses, or it can be offered as a standalone class or club.\r\n\r\nIn the classroom, students learn logical skills through programming as well as design and construction skills through building. Robotics makes student learning visible and fun. Students can demonstrate their knowledge to themselves and other students through classroom demonstrations. The classroom experience can be expanded through student participation in both national and international competitions.\r\n\r\nThe study of robotics can begin with as early as kindergarten continue to post–secondary study.  he knowledge and skills gained through the study of robotics can be important in future jobs and one's personal life.",
      2 => "Unmanned aerial aircraft or drones have been in the headlines for several years, but often only for their military uses. A growing number of schools and educators are incorporating drones into their STEM programs as agile research and teaching tools. Take a look at these resources selected to help you develop a drone education program or research non-military uses of these powerful tools.\r\n\r\nThe resources include videos that highlight educational uses of drones as well as some that detail the construction of them. The apps include both actual drone control apps (remote control replacements) or training simulators along with research–tracking apps. The featured websites focus on established educational programs as well as news and research sites. All of these resources will require adaptation by the teacher to place them in the appropriate context for students.\r\n\r\nThere are many additional resources more specific in scope that contain great resources for students. However, our selections are the most accessible and universal to students that are first learning about Drones. With this base of knowledge, they will no doubt find more niche resources that accommodate their specific interests and career paths. ",
      3 => "3D printing, also known as additive manufacturing, is the process of manufacturing 3D solid objects from a digital file.  A 3D object is created by a printer laying down successive layers of material (plastics, metal, rubber) until an entire object is created.\r\n\r\n3D printing is a disruptive technology or innovation that is expected to add thousands of jobs to the economy as its use grows. The technology is already an established industrial technology used for prototyping and manufacturing products and components across a wide range of industries.  \r\n\r\n3D Printers that convert digitally generated three–dimensional models into plastics, metal, rubber and other materials can now be purchased for less than $1,000. Because 3D printing is more affordable, it is quickly gaining momentum in schools through subject classes and makers clubs. Most exciting is that the technology allows students' creations to come to life. For example, chemistry students can print out 3D molecules, biology students have the ability to print out cross–sections of organs, and engineering students can print out prototypes of their creations.  \r\n\r\nWe've taken the best 3D printing resources and compiled a list of videos, websites, and apps that will get you started with teaching this exciting disruptive technology known as 3D printing.",
      4 => "Space exploration is arguably the most important endeavor in human history. In an incredibly short period of time, we have imagined and built ships that safely brought human beings to the Moon’s surface and back.  \r\n\r\nFrom this experience, we not only furthered our understanding of the Universe, but have laid the groundwork for some of the most important technological advances of all time. Space agencies around the world continue to innovate, pushing the limits of human knowledge and technology further and further. Not only does space travel help us to answer the many questions remaining about the Universe, it also inspires innovation, stimulates the economy, and sparks the curiosity of young people, the innovators of the future.\r\n\r\nWhile there exist many videos, apps, and websites that focus on the past, present, and future of space exploration, many teachers, students, and others who are interested in learning more have a difficult time locating the best resources.Here we have assembled the best combination of online resources that showcase all the incredible achievements that have been made, and are yet to be made.",
      5 => "Forensics is an integrated science that includes aspects of biology, chemistry, and physics.  It is of high interest to students and helps them to develop problem–solving skills. Students are highly engaged when the topic is crime, and they often do not even realize how much they are learning.\r\n\r\nForensics courses include the analysis of evidence (such as interpreting personalities and determining guilt). They also offer opportunities to incorporate the teaching of history, current events, and even digital citizenship in addition to science.  \r\n\r\nFor high school students sorting through crime–related videos to locate material that is accurate, informative, and appropriate can be a time–consuming and exhausting process. The video materials offered here provide you with high–quality content. In addition, the identified websites incorporate curriculum resources that can be immediately used in your classroom.\r\n\r\nForensics allows for students to engage in mock crime scene analysis, analyze data collected, develop reports of findings, etc. The applications identified here provide tools that allow your students to act as forensics scientists.",
      6 => "Application developers are responsible for transforming software requirements into workable programming code to create innovative and useful applications. Applications, also known as \"apps,\" can be written for a specific operating system, such as iOS or Android, or they can be written for and used across multiple platforms including computers and mobile devices. Application development, however, isn’t limited to handheld devices and tablets, and the technology is expected to gain popularity with other devices in the future. For example, an Android app on your refrigerator may count calories and perhaps let you know when the milk will spoil. \r\n\r\nWith the Department of Labor predicting a 34 percent increase in app development jobs in the next few years, students with science, math, technology, and engineering skills will be well positioned for a job in this industry. Teaching application development can be tricky, but there are excellent resources available to support the process. \r\n\r\nFortunately, we have listed a number of resources that will encourage more young people to pursue application development. Here you will find the best combination of online resources that introduce students to the exciting career of app development.",
      7 => "Creating an illusion of movement through a rapid display of images with paper flipbooks has always been a fun activity for children. Sophistication of this technique grows as animators explore various mediums and tools. More sophisticated renderings of animation can be found in animated GIFS, as well as fully animated features and stop–motion videos.\r\n\r\nAs popular as this medium has become in entertainment, schools and families can find various benefits in the exploration of animation. From self–constructed animations that tell a story to animation that explains science phenomena, children can use powerful tools to create their own animations. Longterm potential in the job market is impressive as well. Various fields in science use animation tools to expand their research and findings.\r\n\r\nWhile children can still create paper flipbooks for animation, we now have many more exciting tools to explore. With websites, videos, and applications for building and creating, students interested in this subject will definitely find resources to expand their understanding. We have assembled the best combination of these resources to jump in and explore animation.",
      8 => "Nearly everyone has probably heard of Dolly, the first cloned sheep, but what about Bessie the gaur? Cloning is often portrayed as unethical, but what about when it is used to cure disease or to save threatened and endangered species?\r\n\r\nThis collection of resources will provide students with a wide variety of information and points of view. From videos that are targeted to even the youngest children to those that are detailed, academic animations with challenging vocabulary, students will have a great base for further research.\r\n\r\nThat research may begin at one of our showcased websites. Here we emphasize variety and accessibility to appeal to kids just learning about this subject in the classroom.\r\n\r\nThe apps focus on the concepts and vocabulary of cloning and genetics. These tools can be used to build a base of knowledge that students will use to more fully understand and use the information gathered from the other resources.",
      9 => "Accurate weather forecasts today are  something that we all take for granted. In reality, predicting the conditions of the atmosphere is an imprecise and complex science. While we have come a long way, much of the field is still a mystery.  \r\n\r\nTechnology such as doppler radar, hurricane hunter aircraft, and computer modeling software has helped greatly in improving our forecasts. Additionally, we have accumulated unprecedented stockpiles of climate data that have allowed us to recognize the changes that are currently taking place. Understanding how the atmosphere functions and developing newer, better tools for monitoring it are key to protecting our habitat from changes that we already see taking place. Students must arm themselves with a deep knowledge about how weather and climate function so that they are prepared to deal with an evolving atmosphere and its potential impacts on our day–to–day lives.\r\n\r\nThere are many places to explore and research the information behind weather forecasting and climate change.  Resources include video content, mobile applications, and websites.  To help you get started, we curated some of the most accessible and engaging resources available.",
      10 => "Data Security is one of the most important areas within the the technology industry. From securing information in vast data centers, to masking sensitive email content, to securing the contents of a Skype conversation, tech firms are constantly ensuring that Internet users can have the highest levels of security.\r\n\r\nA subset of math skills is required for data security, and at a high school level, these would include logic, algorithms, modular arithmetic, and probability in addition to powerful coding skills.  \r\n\r\nEncryption and cryptography are fascinating areas and can be introduced through fun apps such as \"Cryptaroo\" and the Enigma simulator app (a replica of the infamous crypto machine). The NSA’s \"CryptoChallenge\" app is a great way to discover encrypted phrases and challenge students' thinking.\r\n\r\nKhan Academy has a great selection of videos on cryptography, the \"Intro to Cryptography\" is the first of this great series. From a cloud data security angle, Google discusses the security of data stored in its data centers.\r\n\r\nFor a historic reference, \"Coders and Ciphers\" is an informative exploration into the history of cryptography, whilst \"CryptoClub\" offers up some fun activities for all student levels.",
      11 => "Data Mining is the science of gathering relevant information from very large sets of data through the use of technology. Businesses in the fields of education, health, business, social media, news outlets, and many more use data scientists to dig deeper into data.\r\n\r\nTraditionally taught as a computer science course, the resources collected here represent accessible tools, tutorials, and demonstrations relevant to a high school curricula. Data mining is a complex field. These tools have been brought together to make studying data mining at the high school level and beyond more accessible.\r\n\r\nA study strand might begin with the \"Data Mining/An Overview\" and \"Big Data, Small World\" video presentations, introducing the impact of data mining, followed by the excellent web resource and exploration, \"Surveillance to Data Mining.\" \"StatViz\" and \"Data Explorer\" apps offer the ability to analyze data in tablets or handheld apps. Finally, the excellent interactive ebook, \"The Human Face of Big Data Tablet App,\" features some great details and imagery of big data.\r\n\r\nAnother powerful tool, \"Google Fusion Tables,\" provides students with powerful data analysis tools to explore data and map large datasets.",
      12 => "A knowledge and understanding of coding is a valuable asset for students, as it gives them the ability to create as well as consume. There is a wide range of excellent resources (both paid and free) that support the acquisition and implementation of coding skills, many of which are available for multiple platforms. These resources are both accessible and engaging.  \r\n\r\nCoders are helping to define the world in which we live, and especially the world the next generation will occupy. Armies of coders lie behind sites such as Facebook and Twitter, and students with powerful coding skills will be able to contribute to the latest tech platforms as well as those that haven't even been thought of yet.\r\n\r\nA great place to start is the \"Code Stars\" video used to launch the Hour of Code. This video is very engaging, and it features numerous well–known tech people as well as some athletes. Thereafter, new coders could try out the fun Lightbot app and video lessons provided by Khan Academy. More advanced coders would find the \"14-Year-Old Prodigy\" video inspirational, then could try out the advanced online university apps to write their first programs.\r\n\r\nThere is a vast collection of websites, web apps, videos and mobile apps that makes finding the best tools a challenge. We have put together some of the best resources for getting started in coding, from basic tools to advanced coding platforms.",
      13 => "Video game development involves a series of programming steps that a developer must take to create an engaging video game. A video game developer may work as an individual or with a small independent developer or development team. In the future, it is more likely that designers will work as part of a team for a large company like Electronic Arts. A career in video game development involves understanding a number of STEM disciplines and skills. \r\n\r\nVideo game designers not only depend on their own creativity to create the ultimate game, but they also depend on available technology, which is rapidly growing. These rapidly expanding technology resources will allow for some mind–blowing games in the future. Growth in the video game development industry won’t be limited to just games that entertain us. Serious games and simulations are becoming increasingly important. This includes simulations that are used by different industries to simulate real–world events or processes designed to teach people how to solve real–world problems. \r\n\r\nStudents love video games!  So why not take advantage of the many teaching tools available that will allow students to design and program their own games? We’ve put together the best combination of online resources to grab your students’ attention!",
      14 => "Artificial Intelligence (AI) is being used to transform education, health care, manufacturing, and business. It is an exciting and growing area of computer science that involves the creation of intelligent machines that are similar to humans in their ability to \"think\" and interact.  \r\n\r\nCurrently, computers with artificial intelligence have been designed for speech recognition, decision-making, problem solving, and language translation. Artificial intelligence is a broad field and includes expert systems, natural language, neural networks, games, and robotics.\r\n\r\nArtificial intelligence fascinates many students, and its popularity can be seen in recent movies such as  “Her” and “Transcendence.\" We selected some interesting teaching materials to get your students interested in AI, and actually do some programming for a taste real world experience. \r\n\r\nAs the technology is still in the embryonic stage, we also includes selections that showcase how AI is being used today in commercial products and services. ",
      15 => "Data compression techniques are a really important field for technology companies as they seek to deliver high–definition video, high–quality audio, and ever larger images on smartphones over the Internet. The skills required for these techniques involve math, algorithms, and programming. This category has many great resources to introduce and develop these basic skills.\r\n\r\nFor starters, mp3 technology is enabling manufacturers to create handheld devices that can store almost unlimited amounts of music. Begin learning about media compression with the story of the mp3 and how the algorithm was designed to remove parts of music without changing the sound to the human ear.\r\n\r\nDiscover why math is so important for compression analysis and how algorithms are applied in different situations to achieve smaller file sizes with these informative web resources.\r\n\r\nThe app selections are all interactive applications of various algorithms. They are all tools to help understand algorithms and how they are used in compression techniques.",
      16 => "Petroleum Engineering is an important occupation in one of the most lucrative and, in many ways, controversial industries of the 20th and 21st centuries.  Particularly since the Deep Water Horizon accident, the industry has been facing a public image challenge. Petroleum engineers, however, are among the highest paid professionals in the United States. \r\n\r\nOur video, app, and website recommendations serve to provide clear and unbiased portrayals of the processes involved in the collection of this important non–renewable resource as well as the important career fields related to the safe and economical retrieval of petroleum.\r\n\r\nThe collection includes two videos that highlight the important roles that engineers play in the industry and two videos that provide background or historical information on the use of oil and and the processes of locating, extracting, and refining petroleum products.\r\n\r\nThe apps range from simulation–style games to reinforce concepts to handy research tools perfect for \"exploring deeper\" into the petroleum industry.\r\n\r\nThe websites focus on the professions that are directly involved in the industry, and each of the sites includes a plethora of educational and training resources, along with the latest research and news related to the industry.",
      17 => "Augmented Reality is more than a hot topic or trend that will disappear in the next few months. It provides users with a new way to interact with content and will transform the way people explore the world around them. This powerful technology layers content on top of the real world. All you have to do is open up an Augmented Reality app and point your device towards an AR trigger or activate your GPS to explore the world around you in a whole new way.\r\n\r\nMany industries are embracing Augmented Reality technology, including some areas you may find surprising. Doctors and researchers are discovering applications in the field of medicine, while the entertainment industry is looking to provide new experiences to their audience. Physical fitness may be transformed in the future, thanks to Augmented Reality.\r\n\r\nWe found videos, websites, and mobile apps that will help you wrap your head around a concept that was once only seen on science fiction programs. These resources explore the variety of applications for Augmented Reality in your everyday life and acknowledge its current limitations. It won’t take long to figure out how this technology has the potential to change the world!",
      18 => "The study of biodiversity includes an examination of the variety of life that can be found throughout the world.  From the depths of the ocean to the top canopy of the rainforest, animal and plant life comes in many shapes and sizes. This is an exciting field where discoveries and innovations take place on a daily basis. Students will examine life cycles, food webs, and energy pyramids to understand the complex relationship between members of an ecosystem. A career in biodiversity can take students from cities, to farms, or to remote villages around the world.  \r\n\r\nSTEM–based skills are in high demand in fields that specialize in biodiversity. Students interested in a career in Wildlife Management in the National Parks, engineering solutions to address invasive species, or starting a business that focuses on ecotourism will need a thorough understanding of biodiversity and how every living thing is connected. An appreciation of the delicate balance between plants and animals in an ecosystem is essential to preserve the way of life of all species on Earth.\r\n\r\nThe resources selected for this topic will help you explore the wide range of living species on the planet.  There are videos that introduce and explain the concept of biodiversity, websites that demonstrate the impact one can have in a career in this field, and apps that will help users explore biodiversity.",
      19 => "Hardware engineering, and the closely related computer engineering and computer sciences fields, offers a wealth of opportunities for students. The resources in this collection are designed to engage students in topics related to these fields and to help prepare students for their careers. The tools promote the mastery of basic skills and knowledge that will reduce the amount of transitional learning that many students encounter.\r\n\r\nFor instance, there is only a limited amount of direct hardware designs that most students will be able to complete simply because of the availability of equipment and resources. However, all students will benefit from having a thorough understanding of how various computer systems operate and how to troubleshoot common issues.\r\n\r\nAccordingly, the resources in this collection focus on hardware design as a career choice, basic computer hardware knowledge (such as terminology and basic principles), and advanced computer hardware troubleshooting and repair (including certification opportunities available today.)\r\n\r\nLaunching a Hardware Design career is made easier with this base of knowledge in place. ",
      20 => "Banks, brokerages, and insurance companies have huge tech departments to maintain their competitiveness in the world of finance. From ensuring that trades get to markets in the shortest possible times to calculating the risk of new drivers to insurance companies, complex technology governs much of the finance world.\r\n\r\nThis section brings together a variety of resources that can be used as teacher-led activities in class or as a self-study course to prepare students for careers in financial technology.\r\n\r\nThe website resources all comprise excellent learning opportunities for high school students. The \"SIFMA Stock Market Game\" is a hugely popular game played by schools to introduce stock market concepts and encourage students to research the news. The platform itself is a great example of financial technology.  \"EconEdLink\" provides a vast array of resources for the economics class, a great place to start designing a study plan.\r\n\r\nFinancial technology is an expansive and highly complex field. There are many tools available to begin a learning path. These resources, which also include mobile apps and videos, have been pooled together to give students and teachers a framework of material to study that is important to technology today."
    }
  end

end
end
end
