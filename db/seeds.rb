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
  :cate =>'IT')
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
  :cate =>'IT')
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
  :cate =>'IT')
#...

Product.create(:title => 'The Curious Case of Benjamin Button',
  :description => 
    %{<p>
        <em>The Curious Case of Benjamin Button</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/benjamin.jpg',
  :price => 23.75,
  :cate =>'novel')
# . . .

Product.create(:title => 'Debug It!',
  :description => 
    %{<p>
        <em>Debug It!</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/debug.jpg',
  :price => 19.99,
  :cate =>'IT')  
# . . .

Product.create(:title => 'Lowboy',
  :description => 
    %{<p>
        <em>Lowboy</em> is a story about....
        blablabla...
      </p>},
  :image_url => '/images/lowboy.jpg',
  :price => 22.99,
  :cate =>'novel')
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
# ...
User.delete_all
User.create(:name => 'sherry',
  :password => '123', :password_confirmation => '123')
# ...

User.create(:name => '113',
  :password => '113', :password_confirmation => '113')
# ...

Category.delete_all
Category.create(:name => 'Literature')
Category.create(:name => 'Management')
Category.create(:name => 'Children')
Category.create(:name => 'Life')
Category.create(:name => 'Education')

Subcategory.delete_all
Subcategory.create(:name => 'novel', :parent => 'Literature')
Subcategory.create(:name => 'romance', :parent => 'Literature')
Subcategory.create(:name => 'poem', :parent => 'Literature')

Subcategory.create(:name => 'economics and financials', :parent => 'Management')
Subcategory.create(:name => 'finance and investment', :parent => 'Management')

Subcategory.create(:name => 'comics', :parent => 'Children')
Subcategory.create(:name => 'family education', :parent => 'Children')
Subcategory.create(:name => 'age 0~2', :parent => 'Children')
Subcategory.create(:name => 'age 3~6', :parent => 'Children')
Subcategory.create(:name => 'age 7~10', :parent => 'Children')
Subcategory.create(:name => 'age 11~14', :parent => 'Children')


Subcategory.create(:name => 'health', :parent => 'Life')
Subcategory.create(:name => 'marriage', :parent => 'Life')
Subcategory.create(:name => 'fashion', :parent => 'Life')
Subcategory.create(:name => 'entertainment', :parent => 'Life')
Subcategory.create(:name => 'travel', :parent => 'Life')
Subcategory.create(:name => 'pregnancy', :parent => 'Life')
Subcategory.create(:name => 'sports', :parent => 'Life')
Subcategory.create(:name => 'family-encyclopediapedia', :parent => 'Life')

Subcategory.create(:name => 'IT', :parent => 'Education')