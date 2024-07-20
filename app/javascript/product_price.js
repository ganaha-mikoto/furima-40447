// 関数として定義
function calculatePrice() {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      // 販売手数料を計算
      const fee = Math.floor(inputValue * 0.1);
      
      // 販売利益を計算
      const profit = inputValue - fee;

      // DOM要素に販売手数料と販売利益を反映
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = fee;

      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = profit;
    });
  }
}

// turbo:loadとturbo:renderイベントで関数を呼び出し
window.addEventListener('turbo:load', calculatePrice);
window.addEventListener('turbo:render', calculatePrice);
