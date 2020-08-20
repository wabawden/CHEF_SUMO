import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#typed3', {
    strings: ['My strings are: <i>strings</i> with', 'My strings are: <strong>HTML</strong>', 'My strings are: Chars &times; &copy;'],
    typeSpeed: 0,
    backSpeed: 0,
    smartBackspace: true, // this is a default
    loop: true
  });
}

export { loadDynamicBannerText };
