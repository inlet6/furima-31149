function sell_price (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value
    const addTaxPrice = document.getElementById("add-tax-price")
    const tax = Math.trunc(price * 0.1)
    addTaxPrice.innerHTML = tax
    
    const profit = document.getElementById("profit")
    const itemProfit = Math.trunc(price - tax)
    profit.innerHTML = itemProfit 
    
  })
}

window.addEventListener('load',sell_price)