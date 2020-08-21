const priceCalculator = () => {
  const guests = document.querySelector('.guests');
  const priceBox = document.querySelector('.price-box');
  // const sel = document.getElementById('scripts');
// console.log(sel.value);
  const cost = document.querySelector(".price-per-person").innerText;
  // console.log(cost);
  // console.log('still happy');

  guests.addEventListener("change", (event) => {
    event.preventDefault();
  const guestsValue = guests.value;
  const total = guestsValue * cost;
  console.log(guestsValue);
    // console.log('hi');
    document.getElementById('total-price').innerHTML =`<h6 class="mt-3">Total Price: <strong> £${total} </strong></h6>`;
  });
};

export { priceCalculator };
