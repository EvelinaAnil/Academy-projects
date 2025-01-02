const mongoose = require('mongoose');

const studentSchema = new mongoose.Schema({
  name: String,
  age: Number,
  group: { type: mongoose.Schema.Types.ObjectId, ref: 'Group' },
});

module.exports = mongoose.model('Student', studentSchema);
