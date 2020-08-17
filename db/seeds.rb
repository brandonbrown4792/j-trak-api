# Destroy Data
puts 'Destroying Data'
Contact.destroy_all
Job.destroy_all
User.destroy_all


# User
puts 'Creating Users'
brandon = User.create(email: 'brandon@brandon.com', username: 'brandon', password: '123')


# Contacts
puts 'Creating Contacts'
Contact.create(name: 'John Doe', company: 'ABC Company', job_title: 'Engineering Manager', email: 'johndoe@abc.com',
    phone: '555-555-1234', linkedin_profile: 'https://www.linkedin.com/in/johndoe/', user: brandon)
Contact.create(name: 'Jane Smith', company: 'XYZ Company', job_title: 'Senior Software Engineer', email: 'janesmith@xyz.com',
    phone: '555-555-5678', linkedin_profile: 'https://www.linkedin.com/in/janesmith/', user: brandon)


# Jobs
puts 'Creating Jobs'
Job.create(job_title: 'Software Engineer', company: 'ABC Company', link: 'https://abc.com/job-postings/1', status: 0, user: brandon)
Job.create(job_title: 'Back End Software Developer', company: 'XYZ Company', link: 'https://xyz.com/job-postings/4', status: 0, user: brandon)


puts 'Seeding Complete'