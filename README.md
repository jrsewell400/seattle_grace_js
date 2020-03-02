## Seattle Grace
Please follow the setup directions below. Stories for the assessment will be sent out in class.

### Setup
- Fork this repository
- Clone down your forked repository
- Perform the usual setup steps after cloning a Rails application:
    - bundle install,
    - rake db:{drop,create,migrate,seed}

# BEM2 Final Technical Assessment
​
## Description
Seattle Grace is based off of Grey’s Anatomy (Mike’s favorite show), but you need NO knowledge of Grey’s Anatomy to complete this final.
Hospitals have many Doctors, Doctors work for just one hospital. Doctors can have many patients, and patients can have many doctors. A one to many relationship is already set up for you. Make sure to read all instructions, tasks, and user stories before getting started. Also, take a look at your schema to see what you're working with to start.
​
## Instructions
​
* Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle install`
* Run `rake db:{drop,create,migrate,seed}`
* Complete the tasks below
* Push your code to your fork once the time is up (not before!)
​
## Tasks
1. Create a patients table
  - Patients will have a name and age
​
2. Set up a many to many relationship between doctors and patients
​
​
3. Complete the following user stories:
​
​
```
User Story 1, Doctors Show Page
​
As a visitor
When I visit a doctor's show page
I see all of that doctor's information including:
  - name
  - specialty
  - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has
```

```
User Story 2, Patient Index Page
​
As a visitor
When I visit the patient index page
I see the names of all patients listed from oldest to youngest
```
​
```
User Story 3, Hospital Show Page
​
As a visitor
When I visit a hospital's show page
I see the hospital's name
And I see the number of doctors that work at this hospital
And I see a unique list of universities that this hospital's doctors attended
```
​
​
```
User Story 4, Remove a Patient from a Doctor
​
As a visitor
When I visit a Doctor's show page
Next to each patient's name, I see a button to remove that patient from that doctor's caseload
When I click that button for one patient
I'm brought back to the Doctor's show page
And I no longer see that patient's name listed 
