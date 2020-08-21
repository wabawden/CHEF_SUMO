import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ['<i>Hire a</i> Chef', '<i>Be a</i> Chef', '<i>Enjoy Great</i> Food'],
    typeSpeed: 100,
    backSpeed: 100,
    smartBackspace: true, // this is a default
    loop: true
  });
}

export { loadDynamicBannerText };
