To demonstrate difference between zeitwerk and classic autoloaders.

To test: `bin/rails s` and visit "http://localhost:3000/local_admin/users"

You will see error `undefined local variable or method current_admin for #<LocalAdmin::UsersController>`
This method is defined in the engine gem https://github.com/morgoth/bug/blob/master/vendor/admin/app/controllers/admin/application_controller.rb#L10-L12

If you switch autoloader to classic, no error is thrown and page loads fine.

With zeitwerk, there is a `NameError` thrown as `ButtonHelpers` module inside `ApplicationHelper` cannot be autoloaded,
because it does not follow Ruby semantics (it's missing `Admin::` prefix): https://github.com/morgoth/bug/blob/master/vendor/admin/app/helpers/admin/application_helper.rb#L2

This error is catched here https://github.com/rails/rails/blob/f4a30d2a0706f278a20c63a3d99288de79b52e5f/actionpack/lib/action_dispatch/http/parameters.rb#L100-L104 which results in half-defined controller and gives misleading end error.
