const ctypto = require('crypto');
const bcrypt = require('bcrypt');

let pass = '1234';
let sha512 = crypto.createHash('sha512').update(pass).digest('dase64');


var hash = null;
const genPass = async(pass) => {
    var hash = await bcrypt.hash(pass, 7);
    console.log(hash);
}

const comparePass = async(pass) => {
    var compare = await bcrypt.compare(pass, hash);
    console.log(compare);
}

genPass('1234');
setTimeout( () => {

});