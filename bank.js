const btn = document.querySelector('#submit');
const form = document.querySelector('#userForm');
var users = []

btn.addEventListener('click', (e) => {
  // prevent the form from submitting
  e.preventDefault();

  // show the form values
  const formData = new FormData(form);
  const values = [...formData.entries()];
  var user = new Object()

  for (var [key, value] of values) {
    user[key] = value
  }
  createUser(user);
  renderUser(user);
  
});

function createUser(user){
  users.push(user);
}

function renderUser(user){
  $('#display_data').append(`<tr>
              <td>${user.userId}</td>
              <td>${user.firstname}</td>
              <td>${user.account_number}</td>
              <td>${user.balance}</td>
            </tr>`);
}

const transferBtn = document.querySelector('#send');
const transferForm = document.querySelector('#transferForm');

transferBtn.addEventListener('click', (e) => {
  // prevent the form from submitting
  e.preventDefault();


  // show the form values
  const formData = new FormData(transferForm);
  const values = [...formData.entries()];
  
  var transaction = new Object()

  for (var [key, value] of values) {
    transaction[key] = value
  }

  var fromUser = users.find(user => user.userId === transaction['From']);
  var recUser = users.find(user => user.userId === transaction['To']);

  function verify(){

    if (document.getElementById("#u_pin").value === document.getElementById('#y_pin').value){

       users = users.filter((item) => {
         if (item.userId === transaction['From']) {
             item.balance = parseInt(fromUser['balance']) - parseInt(transaction['amount']);
          }
         if (item.userId === transaction['To']) {
             item.balance = parseInt(recUser['balance']) + parseInt(transaction['amount']);
          } 
        return item;
      });
    }
  }

 

 



  $('#display_data').children("tr").remove();
  users.forEach(function (user, index) {
    renderUser(user);
  });
});