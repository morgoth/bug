To demonstrate difference between zeitwerk and classic autoloaders.

To test: `bin/rails s` and visit "http://localhost:3000/local_admin/users"

You will see error `undefined local variable or method current_admin for #<LocalAdmin::UsersController>`
This method is defined in the engine gem "vendor/admin/app/controllers/admin/application_controller.rb"

If you switch autoloader to classic, no error is thrown and page loads fine.

With zeitwerk, there is a problem with autoloading `ButtonHelpers` module inside `ApplicationHelper` in
"vendor/admin/app/helpers/admin/application_helper.rb" which you can observe by:
```
bin/rails r 'puts Admin::ApplicationController'

uninitialized constant Admin::ApplicationHelper::ButtonHelpers
Did you mean?  Admin::ButtonHelpers
```
which somehow is swallowed when running rails server...
