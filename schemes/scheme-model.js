const db = require('../data/dbConfig.js');

const find = async () => {
  return db('schemes')
    .then(schemes => {
        if(schemes) {
          return schemes;
        } else {
          return null;
        }
    })
    .catch(err => {
        console.log(err)
    });
};

const findById = ( id ) => {
  return db('schemes')
    .where({ id })
    .first()
    .then( (scheme) => {
      if ( scheme ) {
        return scheme;
      } else {
        return null;
      }
    })
    .catch( (err) => {
      console.log(err);
    })
};

const findSteps = ( id ) => {
  return db('steps')
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .select("steps.id","schemes.scheme_name", "steps.step_number", "steps.instructions")
    .orderBy("step_number")
    .where({ scheme_id: id })
    .then ( (steps) => {
      return steps;
    })
    .catch( (err) =>{
      console.log(err);
    }) 
};

const add = ( scheme ) => {
  return db('schemes')
    .insert(scheme)
    .then( ([id]) => {
      return findById(id);
    })
    .catch( (err) =>{
      console.log(err);
    })
};

const update = ( changes, id ) => {
  return db('schemes')
  .where({ id })
  .update(changes)
  .then(() => {
      return findById(id);
  })
  .catch( (err) => {
    console.log(err);
  })
};

const remove = ( id ) => {
  return db('schemes').where({id: id}).delete(id)
};

module.exports = {
    find, 
    findById,
    findSteps,
    add,
    update,
    remove
};
