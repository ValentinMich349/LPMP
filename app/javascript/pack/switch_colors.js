document.addEventListener('DOMContentLoaded', function () {
  const colorSwitchButton = document.getElementById('color-switch');
  const colorMapping = {
    '#264653': '#322F4F',
    '#2A9D8F': '#554C93',
    '#E9C46A': '#DBDD85',
    '#F4A261': '#D5DB74',
    '#E76F51': '#BAC35A'
    // Ajoutez d'autres mappages si nécessaire
  };

  const originalColors = new Map();

  colorSwitchButton.addEventListener('click', function () {
    document.querySelectorAll('*').forEach(function (element) {
      if (element.hasAttribute('style')) {
        let style = element.getAttribute('style');
        for (const [originalColor, newColor] of Object.entries(colorMapping)) {
          const regex = new RegExp(originalColor, 'gi');
          if (style.match(regex)) {
            style = style.replace(regex, newColor);
            element.setAttribute('style', style);
          }
        }
      }
    });
  });

  function rgbToHex(rgb) {
    const rgbArray = rgb.match(/\d+/g);
    if (!rgbArray) return rgb;
    return '#' + rgbArray.map(function (x) {
      return ('0' + parseInt(x).toString(16)).slice(-2);
    }).join('');
  }
});
