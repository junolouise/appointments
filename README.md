# appointments
This sorts appointments based from an old to a new schedule on their most relevant timeslot.

# Running the tests
'bundle install'
'bundle exec rspec session_mapper_spec.rb'

# Approach
- Removed suspended sessions from the old times array first
- Sorted times by the starts_at then assumed a 1:1 mapping between old and new times is sufficient
- Because there will be a fixed number of items in the hash, I decided a hash literal to be more readable than using an approach with fewer lines
