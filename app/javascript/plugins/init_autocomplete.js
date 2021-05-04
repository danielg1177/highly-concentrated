import places from 'place.js';
const initAutocomplete = () => {
  const addressInupt = document.getElementById('pickup_local');
  if (pickup_localInput){
    places([{container: pickup_localInput}]);
  }
};

export {initAutocomplete};
