# Rales Engine

This project is a JSON API which exposes the SalesEngine data schema.

Project details can be found here: [Rales Engine](http://backend.turing.io/module3/projects/rails_engine)

Ruby Version: 2.3.1
<br>
Rails Version: 5.0.0.1

#### Setup

To run this project:

```
git clone git@github.com:epintozzi/rales_engine.git
cd rales_engine
bundle install
rake db:create db:migrate
rake populate_database:populate_all
```
Populating the database may take a few minutes, so please be patient.

#### Testing

This project uses RSpec for testing and can be run with the command `rspec`

This project also employs a Spec Harness. More info on the spec harness can be found here: [Rales Engine Spec Harness](https://github.com/turingschool/rales_engine_spec_harness)
