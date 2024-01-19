/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function validEnvoi() {
    if (window.document.querySelector("#i_nom").value === "" &&
            window.document.querySelector("#i_prenom").value === "") {
        alert("Le nom ou le prénom doivent être remplis"); // On affiche un message
    } 
    else if (window.document.querySelector("#i_email").value === "") {
        alert("L'email doit être rempli"); //On affecte un message
    } 
    else {
        let question = "Souhaitez-vous réellement utiliser l'adresse suivante : "
                + window.document.querySelector("#i_email").value;
        if (confirm(question)) {
            window.document.querySelector("#form_contact").submit(); // On peut envoyer
        }
    }
}
window.addEventListener("load", function () {
    window.document.querySelector("#btn_envoyer").addEventListener("click", validEnvoi);
});

