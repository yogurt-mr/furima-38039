function tax() {
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('keyup', () => {
      const price = itemPrice.value;
      const taxPrice = Math.floor(price * 0.1);
      const saleProfit = Math.floor(price - taxPrice);
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = taxPrice;
    
      const profit = document.getElementById("profit");
      profit.innerHTML = saleProfit;
  });
}
window.addEventListener("load", tax);