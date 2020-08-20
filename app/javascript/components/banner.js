import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ['ChefSumo: <i>Hire a</i> Chef', 'ChefSumo: <i>Be a</i> Chef', 'ChefSumo: <i>Enjoy Great</i><strong> Food</strong>'],
    typeSpeed: 100,
    backSpeed: 100,
    smartBackspace: true, // this is a default
    loop: true
  });
}

export { loadDynamicBannerText };
