let itemsForm = document.querySelectorAll("#items-form")
let container = document.querySelector("#form-container")
let addButton = document.querySelector("#add-form")
let deleteButton = document.querySelector("#delete-form")
let totalForms = document.querySelector("#id_form-TOTAL_FORMS")
let formNum = itemsForm.length - 1
addButton.addEventListener('click', addForm)
deleteButton.addEventListener('click',deleteForm)

function addForm(e) {
    e.preventDefault()
    let newForm = itemsForm[0].cloneNode(true)
    let formRegex = RegExp(`form-(\\d){1}-`, 'g')
    formNum++
    newForm.innerHTML = newForm.innerHTML.replace(formRegex, `form-${formNum}-`)
    container.insertBefore(newForm, addButton)
    totalForms.setAttribute('value', `${formNum + 1}`)
}
