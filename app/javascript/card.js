const pay = () => {
  Payjp.setPublicKey("pk_test_cb734ef92ca66668f928e863");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get('pay_form[number]'),
      cvc: formData.get('pay_form[cvc]'),
      exp_month: formData.get('pay_form[exp_month]'),
      exp_year: `20${formData.get('pay_form[exp_year]')}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);