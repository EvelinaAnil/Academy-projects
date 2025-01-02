let arraycounter = function(arr)
{
    return "В массиве находится "+arr.length +" элементов"
}
let age = 100;

let mult = function(x, y)
{
    return `${x} * ${y} = ${x * y}`;
}

// export default  f2 = () => {
//     console.log('call f2()....');
// }

// module.exports.arrfunc = arraycounter;
// module.exports.age = age;
// module.exports.mult = mult;

module.exports = {
    arrfunc: arraycounter,
    age,
    mult
}