// We import the default value from ember-data into the variable DS.
//
// Ember-Data exports by default a namespace (known as DS) that exposes all the
// classes and functions defined in http://emberjs.com/api/data.
import DS from 'ember-data';

// Define the default export for this model, which will be a subclass
// of DS.Model.
// After this class has been defined, we can import this subclass doing:
// import Friend from 'borrowers/models/friend'
// We can also use relative imports. So if we were in another model, we
// could have written
// import Friend from './friend';
export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  email: DS.attr('string'),
  twitter: DS.attr('string'),
  totalArticles: DS.attr('number')
});
