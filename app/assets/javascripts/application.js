// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



/**
 * RGB to HSL
 * https://css-tricks.com/converting-color-spaces-in-javascript/
 */
rgbToHsl = (r, g, b) => {
  // Make r, g, and b fractions of 1
  r /= 255;
  g /= 255;
  b /= 255;

  // Find greatest and smallest channel values
  let cmin = Math.min(r,g,b),
      cmax = Math.max(r,g,b),
      delta = cmax - cmin,
      h = 0,
      s = 0,
      l = 0;
  
  // Calculate hue
  // No difference
  if (delta == 0)
    h = 0;
  // Red is max
  else if (cmax == r)
    h = ((g - b) / delta) % 6;
  // Green is max
  else if (cmax == g)
    h = (b - r) / delta + 2;
  // Blue is max
  else
    h = (r - g) / delta + 4;

  h = Math.round(h * 60);
    
  // Make negative hues positive behind 360°
  if (h < 0)
      h += 360;
  
  // Calculate lightness
  l = (cmax + cmin) / 2;

  // Calculate saturation
  s = delta == 0 ? 0 : delta / (1 - Math.abs(2 * l - 1));
    
  // Multiply l and s by 100
  s = +(s * 100).toFixed(1);
  l = +(l * 100).toFixed(1);

  // return "hsl(" + h + "," + s + "%," + l + "%)";
  return [h, s, l];
}


const container = document.querySelector('.container');

let bgColor = getComputedStyle(container);
bgColor = bgColor.backgroundColor.replace(/[()rgba ]/g,"").split(",");

const hsl = rgbToHsl(bgColor[0], bgColor[1], bgColor[2]),
      degree = 8;


window.addEventListener('scroll', () => {
  let y = (window.scrollY || window.pageYOffset) / 100;
  y = y < 0 ? 0 : y; // ensure y is always >= 0 (due to Safari's elastic scroll)
  
  const hue = hsl[0] + y * degree,
        [h, s, l] = [hue, hsl[1], hsl[2]];

  container.style.backgroundColor = `hsl(${h}, ${s}%, ${l}%)`;
});