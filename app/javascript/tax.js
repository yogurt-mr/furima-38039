function tax() {
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('change', () => {
      const price = itemPrice.value;
      const taxPrice = price * 0.1;
      const saleProfit = price - taxPrice;
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = taxPrice;
    
      const profit = document.getElementById("profit");
      profit.innerHTML = saleProfit;
  });
}
window.addEventListener("load", tax);