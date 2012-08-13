# encoding: utf-8
Product.delete_all
Product.create(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :image_url =>   '/images/wd4d.jpg',    
  :price => 42.95,
  :cate =>'programming;web;UI;interactive design')
# . . .
Product.create(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :image_url => '/images/ruby.jpg',
  :price => 49.50,
  :cate =>'programming;web;algorithm')
# . . .

Product.create(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image_url => '/images/rtp.jpg',
  :price => 43.75,
  :cate =>'programming;web')
#...

Product.create(:title => 'The Curious Case of Benjamin Button',
  :description => 
    %{<p>
        <em>The Curious Case of Benjamin Button</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/benjamin.jpg',
  :price => 23.75,
  :cate =>'novel;detective')
# . . .

Product.create(:title => 'Debug It!',
  :description => 
    %{<p>
        <em>Debug It!</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/debug.jpg',
  :price => 19.99,
  :cate =>'programming;algorithm')  
# . . .

Product.create(:title => 'Lowboy',
  :description => 
    %{<p>
        <em>Lowboy</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/lowboy.jpg',
  :price => 22.99,
  :cate =>'novel;romance')
# . . .

Product.create(:title => 'Waterfront',
  :description => 
    %{<p>
        <em>Waterfront</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/waterfront.jpg',
  :price => 11.99,
  :cate =>'novel')

Product.create(:title => 'Harry Potter and the Deathly Hallows',
  :description => 
    %{<p>
        <em>Harry Potter</em> has been burdened with a dark, dangerous 
        and seemingly impossible task: that of locating and destroying 
        Voldemort's remaining Horcruxes. Never has Harry felt so alone, 
        or faced a future so full of shadows. But Harry must somehow find 
        within himself the strength to complete the task he has been given.
      </p>},
  :image_url => '/images/deathlyhallows.jpg',
  :price => 23.99,
  :cate =>'novel;magic;fairy tale;legend')

Product.create(:title => 'The Tales of Beedle the Bard',
  :description => 
    %{<p>
        <em>The Tales of Beedle the Bard</em> is also a plot device in 
        the seventh novel of the Harry Potter series, Deathly Hallows, 
        in which it is bequeathed to Hermione Granger by Albus Dumbledore.
      </p>},
  :image_url => '/images/beedlethebard.jpg',
  :price => 3.99,
  :cate =>'novel;magic;fairy tale')

Product.create(:title => 'Pride and Prejudice',
  :description => 
    %{<p>
        <em>Pride and Prejudice</em> has remained one of the most popular
         novels in the English language. Jane Austen herself called this 
         brilliant work her "own darling child." Pride And Prejudice , the 
         story of Mrs. Bennet's attempts to marry off her five daughters is 
         one of the best-loved and most enduring classics in English literature. 
      </p>},
  :image_url => '/images/pride.jpg',
  :price => 29.99,
  :cate =>'novel;romance')

Product.create(:title => 'Sherlock Holmes',
  :description => 
    %{<p>
        Since his first appearance in Beeton's Christmas Annual in 1887,
         Sir Arthur Conan Doyle's Sherlock Holmes has been one of the most
          beloved fictional characters ever created.Now, in two paperback 
          volumes, Bantam Classics presents all fifty-six short stories and 
          four novels featuring Conan Doyle's classic hero--a truly complete
          collection of Sherlock Holmes's adventures in crime！
      </p>},
  :image_url => '/images/sherlock.jpg',
  :price => 19.99,
  :cate =>'novel;detective')

Product.create(:title => 'Death on the Nile',
  :description => 
    %{<p>
        Agatha Christie's most exotic murder mystery, reissued with a striking 
        new cover designed to appeal to the latest generation of Agatha Christie 
        fans and book lovers. The tranquillity of a cruise along the Nile is shattered 
        by the discovery that Linnet Ridgeway has been shot through the head. 
      </p>},
  :image_url => '/images/deathofthenile.jpg',
  :price => 17.45,
  :cate =>'novel;detective')

Product.create(:title => 'Time Machine',
  :description => 
    %{<p>
        <em>Time Machine</em> is a story about time travelling. Once upon a time,
        there was a lonely man who wanted to go back to the past to be with his wife who 
        had been died......  
      </p>},
  :image_url => '/images/timemachine.jpg',
  :price => 23.99,
  :cate =>'novel;romance;science fiction')

Product.create(:title => 'Steve Jobs',
  :description => 
    %{<p>
        Based on more than forty interviews with Jobs conducted over two years—as 
        well as interviews with more than a hundred family members, friends, 
        adversaries, competitors, and colleagues—Walter Isaacson has written a 
        riveting story of the roller-coaster life and searingly intense 
        personality of a creative entrepreneur.
      </p>},
  :image_url => '/images/jobs.jpg',
  :price => 49.99,
  :cate =>'biography')

Product.create(:title => 'The Warren Buffett Way',
  :description => 
    %{<p>
        A decade has passed since the book that introduced Warren Buffett to 
        the world - The Warren Buffett Way by Robert Hagstrom - first appeared. 
        Since then, Buffett has solidified his reputation as the greatest investor 
        of all time - quietly amassing a multibillion-dollar fortune, despite the 
        wild fluctuation of the markets.
      </p>},
  :image_url => '/images/warrenbuffett.jpg',
  :price => 39.99,
  :cate =>'finance and investment;biography')

Product.create(:title => 'Principles of Economics',
  :description => 
    %{<p>
        <em>Principles of Economics</em> contains a wealth of Asian examples, case studies 
          and news articles to make the material more relevant to Asian students.  
      </p>},
  :image_url => '/images/principlessofeconomics.jpg',
  :price => 34.99,
  :cate =>'economics and financials;socialty')

Product.create(:title => 'History of Religions',
  :description => 
    %{<p>
        For nearly fifty years, History of Religions has set the standard for the 
        study of religious phenomena from prehistory to modern times. History of Religions 
        strives to publish scholarship that reflects engagement with particular traditions,
         places, and times and yet also speaks to broader methodological and/or theoretical 
         issues in the study of religion.  
      </p>},
  :image_url => '/images/historyofreligions.jpg',
  :price => 59.99,
  :cate =>'history;socialty;religion')

Product.create(:title => 'Sofies Verden',
  :description => 
    %{<p>
         <em>Sofies verden</em> er en filosofisk roman skrevet av forfatteren 
         Jostein Gaarder. Boken ble utgitt i 1991 med undertittelen: «En roman 
         om filosofiens historie». I 1995 var boka regnet som verdens mest solgte 
         roman. 
      </p>},
  :image_url => '/images/sofies.jpg',
  :price => 19.99,
  :cate =>'novel;philosophy')

Product.create(:title => 'Lessons for Students in Architecture',
  :description => 
    %{<p>
         <em>Lessons for Students in Architecture</em> is talking about......
      </p>},
  :image_url => '/images/architecture.jpg',
  :price => 69.99,
  :cate =>'architecture')

Product.create(:title => 'Harry Potter:Page to Screen',
  :description => 
    %{<p>
         <em>Harry Potter:Page to Screen</em> is talking about......
      </p>},
  :image_url => '/images/pagetoscreen.jpg',
  :price => 99.99,
  :cate =>'novel;magic;movie')


# ...
User.delete_all
Cart.delete_all

sherry = User.create(:name => 'sherry',
  :password => '123', :password_confirmation => '123')
Cart.create(:user_id => sherry.id)

admin = User.create(:name => 'admin',
  :password => 'admin', :password_confirmation => 'admin')
Cart.create(:user_id => admin.id)

ad = User.create(:name => 'ad',
  :password => 'ad', :password_confirmation => 'ad')
Cart.create(:user_id => ad.id)

Category.delete_all
Category.create(:name => 'Literature')
Category.create(:name => 'Management')
Category.create(:name => 'Culture')
Category.create(:name => 'Life')
Category.create(:name => 'Technology')

Subcategory.delete_all
Subcategory.create(:name => 'novel', :parent => 'Literature')
Subcategory.create(:name => 'romance', :parent => 'Literature')
Subcategory.create(:name => 'poem', :parent => 'Literature')
Subcategory.create(:name => 'magic', :parent => 'Literature')
Subcategory.create(:name => 'fairy tale', :parent => 'Literature')
Subcategory.create(:name => 'science fiction', :parent => 'Literature')
Subcategory.create(:name => 'detective', :parent => 'Literature')
Subcategory.create(:name => 'legend', :parent => 'Literature')
Subcategory.create(:name => 'biography', :parent => 'Literature')

Subcategory.create(:name => 'economics and financials', :parent => 'Management')
Subcategory.create(:name => 'finance and investment', :parent => 'Management')

Subcategory.create(:name => 'history', :parent => 'Culture')
Subcategory.create(:name => 'philosophy', :parent => 'Culture')
Subcategory.create(:name => 'socialty', :parent => 'Culture')
Subcategory.create(:name => 'architecture', :parent => 'Culture')
Subcategory.create(:name => 'religion', :parent => 'Culture')
Subcategory.create(:name => 'movie', :parent => 'Culture')

Subcategory.create(:name => 'health', :parent => 'Life')
Subcategory.create(:name => 'marriage', :parent => 'Life')
Subcategory.create(:name => 'fashion', :parent => 'Life')
Subcategory.create(:name => 'entertainment', :parent => 'Life')
Subcategory.create(:name => 'travel', :parent => 'Life')
Subcategory.create(:name => 'photography', :parent => 'Life')
Subcategory.create(:name => 'sports', :parent => 'Life')

Subcategory.create(:name => 'programming', :parent => 'Technology')
Subcategory.create(:name => 'web', :parent => 'Technology')
Subcategory.create(:name => 'UI', :parent => 'Technology')
Subcategory.create(:name => 'algorithm', :parent => 'Technology')
Subcategory.create(:name => 'interactive design', :parent => 'Technology')
Subcategory.create(:name => 'data mining', :parent => 'Technology')

