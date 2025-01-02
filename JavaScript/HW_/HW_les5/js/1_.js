/*
class Product {
    constructor(params = {}) {
      Object.assign(this, {
        pName: null, 
        amount: 1, 
        bought: false
      }, { ...params }); 
    }
  
    static sortDefault(a, b) {  // чтобы сначала шли некупленные продукты, а потом – купленные
      return (a.bought - b.bought) * 10 + a.pName.localeCompare(b.pName); 
    }; 
  }
  Product.prototype.toString = function () {
    return `${this.pName} (x${this.amount}), ${this.bought ? 'куплено' : 'не куплено'}`;
  }; 
  
  
  const shopList = [
    { pName: 'Банан', amount: 2 },
    { pName: 'Апельсин', amount: 5, bought: true },
    { pName: 'Молоко', bought: true },
    { pName: 'Груша', amount: 10 }
  ].map(prodDef => new Product(prodDef));
  
  const addToShopList = prodDef => {  
     const prod = shopList.find(prod => prod.pName === prodDef.pName && prod.bought=== false); 
    if (!prod) return shopList.push(new Product(prodDef)); 
    prod.amount += prodDef.amount; 
    //if(prod.bought==true ) return shopList.push(new Product(prod)); 
   // prod.amount -= prodDef.amount; 
  }; 
  const printShopList = () => shopList.forEach(
    (prod, i) => console.log(`${i + 1}. ${prod}`)
  ); 
  const delToShopList = prodDef => {  
    const prod = shopList.find(prod => prod.pName === prodDef.pName); 
    if (!prod) return shopList.pop(new Product(prodDef)); 
    prod.amount -= prodDef.amount; 
    //if (!prod) return shopList.push(new Product( Object.assign(prod.pName,prod.amount,prod.bought=true))); 
    //const prod1 = shopList.find(prod1 => prod1.pName === prodDef.pName); //??!!!--------------------------------------------------
   // if (!prod1 && prod1.bought==true) return shopList.push(new Product(prodDef.pName+prod.amount+prod1.bought==true)); 
    //prod1.amount += prodDef.amount;
    
    const prod1 = shopList.find(prod1 => prod1.pName === prodDef.pName && prod1.bought=== true); 
    if (!prod1) return shopList.push(new Product(prodDef)); 
    prod1.amount += prodDef.amount; 
  }; 
 
  shopList.sort(Product.sortDefault);
  printShopList();
  console.log('---'); 
  
  addToShopList({ pName: 'Банан', amount: 3 });
  addToShopList({ pName: 'Шоколад', amount: 2 });
  shopList.sort(Product.sortDefault);
  printShopList();
  console.log('---'); 
  delToShopList({ pName: 'Банан', amount: 1 ,bought:true});
  printShopList();
  console.log('---'); 
  */

  //2
  
  class Products {
    constructor(params = {}) {
      Object.assign(this, {
        pName: null, 
        amount: 1, 
        price: 13.45
      }, { ...params }); 
    }
  
 
  }
  Products.prototype.toString = function () {
    return `${this.pName} (x${this.amount}), ${this.price}`;
  };amount1=8; 
  //--
  class Buy {
    constructor(params = {}) {
      Object.assign(this, {
        pName: null, 
        amount: 1, 
        price: 13.45
      }, { ...params }); 
    }
  
 
  }
  Buy.prototype.toString = function () {
    return `${this.pName} (x${this.amount}), ${this.price}`;
  }; 
 
  const buy = [].map(Def => new Buy(Def));
  
  const shop = [
    { pName: 'Банан', amount: 2 },
    { pName: 'Апельсин', amount: 5, price: 14.34 },
    { pName: 'Молоко', price: 1000.0 },
    { pName: 'Груша', amount: 10 , price: 30},
    {name: 'Молоко', amount: 2, price: 40}
  ].map(Def => new Products(Def));
  
  const addToShop = prodDef => {  
const prod = shop.find(prod => prod.pName === prodDef.pName ); 
if (!prod) return shop.push(new Products(prodDef)); 
prod.amount += prodDef.amount; 
  }; 

  const printShop = () => shop.forEach(
    (prod1, i) => console.log(`${i + 1}. ${prod1}`)
  ); 
  const Buyprint = () => buy.forEach(
    (prod1, i) => document.write('<tr>'+ (`<td> ${i + 1}. ${prod1} </td>`) +'</tr><br>')
  ); 
  const BuyprintSum = () => buy.forEach(
    (prod1, i) => document.write('<tr>'+ (`<td> ${i + 1}. ${totalSum()} </td>`) +'</tr>')
  ); 
  const BuyprintSumMost = () => buy.forEach(
    (prod1, i) => document.write('<tr>'+ (`<td> ${i + 1}. ${prod1} </td>`) +'</tr>')
  ); 
  const BuyprintSumMiddle = () => buy.forEach(
    (prod1, i) => document.write('<tr>'+ (`<td> ${i + 1}. ${prod1} </td>`) +'</tr>')
  ); 

 

  let all;
const addtoBuy = prodDef => {  
  const prod = buy.find(prod => prod.pName === prodDef.pName );
  if (!prod) return buy.push(new Buy(prodDef)); 
  prod.amount += prodDef.amount; 
        }; 
  const delToShopList = prodDef => { 
    

   const prod = shop.find(prod => prod.pName === prodDef.pName); 
    if (!prod) return shop.pop(new Products(prodDef)); 
    prod.amount -= prodDef.amount; 
    all++; 
    //--
    

  }; 
 let sum = 0;let a=60, b= 9.03;
  const printShop_Check = () => shop.forEach(
    (prod1, i) => console.log(`${i + 1}. ${prod1}`)
  );
  const printShopClear = () => shopclear.forEach(
    (prod1, i) => console.log(`${i + 1}. ${prod1}`)
  ); 
let r = 159.03;


  printShop();
  console.log('---'); 
  
  addToShop({ pName: 'Банан', amount: 3 });
  addToShop({ pName: 'Шоколад', amount: 2 });
  shop.sort(Products.sortDefault);
  printShop();
  console.log('---'); 
  delToShopList({ pName: 'Банан', amount: 1});
  addtoBuy({ pName: 'Банан', amount: 1});
  delToShopList({ pName: 'Банан', amount: 1});
  addtoBuy({ pName: 'Банан', amount: 1});
  delToShopList({ pName: 'Шоколад', amount: 1 });
  addtoBuy({ pName: 'Шоколад', amount: 1 });
  delToShopList( { pName: 'Груша', amount: 3 , price: 30});
  addtoBuy( { pName: 'Груша', amount: 3 , price: 30});
  delToShopList({ pName: 'Апельсин', amount: 2, price: 14.34});
  addtoBuy({ pName: 'Апельсин', amount: 2, price: 14.34});
  shop.sort(Buy.sortDefault);
  printShop();
  console.log('---||')
 document.write("-----------CHECK-----------<br>");
 Buyprint();
 document.write("Summa: "+ r+'<br>');
 let pro=r-(a+b);
 document.write("The most high price: "+ pro+'<br>');
 let pi= r/amount1;
 document.write("The middle price: "+ pi+'<br>');
 function Sun(r){
  for(let f=0;f <=i ; f++){
    let r1;
    r1+=buy.price[i]*buy.amount[i];
  }document.write("Summ:"+r+"<br>");
 }
  //----
//   max = buy.price[0];
// // цикл
// for (let i = 0; i < buy.lenght; i++) {
//   if (buy.price[i] > max) {
//     max = buy.price[i]
// }console.log('Max:'+max);
// }

//---
let products = [
  {name: 'Молоко', q: 2, price: 40},
  {name: 'Киви', q: 4, price: 80}
  ];
  