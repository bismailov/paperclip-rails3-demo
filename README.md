paperclip-rails3-demo
================================

Small tutorial for showing file upload functionality with Paperclip 3.5.1

There a lot paperclip demos, showing some avatar upload and initial setup of
Rails 3 application. But I was looking for some simpler examples, with just
upload functionality, no thumbnails, no Amazon S3 storage.

So, this is a small paperclip 3.5.1 demo app in Rails 3.2.3.


Let's first create our Rails application structure.

    rails new paperclip-sample-app

    cd paperclip-sample-app

Creating database.

    rake db:create


Add *gem "paperclip"* in Gemfile

    bundle install

Generating a simple user resource, Rails will take care of routing and other
stuff. In Rails 3.2 types are string by default if you ommit them generators
(for name and email).

    rails generate scaffold user name email

Now, let's add file attachment ability to our User model.

    rails generate paperclip user video_attachment


This is our new migration in db/migrate:

class AddAttachmentVideoAttachmentToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t| 
      t.attachment :video_attachment
    end
  end 
            
  def self.down
    drop_attached_file :users, :video_attachment
  end 
end
    

Let's apply our migration.

    rake db:migrate

I use annotate gem for adding database table property information to my models,
just a convenience (just run *gem install annotate* if you want it).

    annotate

If you *cat app/models/user.rb* you can see several extra columns starting with
video_attachment_
                          
    # Table name: users
    #
    #  id                            :integer          not null, primary key
    #  name                          :string(255)
    #  email                         :string(255)
    #  created_at                    :datetime         not null
    #  updated_at                    :datetime         not null
    #  video_attachment_file_name    :string(255)
    #  video_attachment_content_type :string(255)
    #  video_attachment_file_size    :integer
    #  video_attachment_updated_at   :datetime

                          
 Add into app/models/user.rb model:

    attr_accessible :name, :email, :video_attachment
    has_attached_file :video_attachment
                          
add into app/views/users/_form.html.erb before submit button:

    <div class="field">
      <%= f.label :video_attachment %><br />
      <%= f.file_field :video_attachment %>
    </div>
                         
Now, run server with *rails server*. That's it, you can access user with   
http://localhost:3000/users

To directly access your uploaded file, say "EMAILS.pdf", you enter something
like:

    http://localhost:3000/system/users/video_attachments/000/000/001/original/EMAILS.pdf

Here, *system* folder is located under project_name/public/.


This is gem's project page: <https://github.com/thoughtbot/paperclip>
