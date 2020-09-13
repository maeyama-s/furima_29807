function price() {
  let tax = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");
  price.addEventListener("keyup", () => {
    let p = document.getElementById("item-price").value;
    tax.innerHTML = Math.floor(p * 0.1).toLocaleString(),
    profit.innerHTML = Math.floor(p * 0.9).toLocaleString()
  });
}
let = price = document.getElementById("item-price");
price.addEventListener('click', price)