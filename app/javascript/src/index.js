export default function index(){
    // return console.log('Hola desde el index.js');
    fetch('/authors', {
        method: 'GET',
        headers: {'Accept': 'application/json'}
    })
    .then(response => response.json())
    .then(authors => renderAuthors(authors))
    .then(authors => document.querySelector('#authors tbody').innerHTML = authors.join('')  )
}


function renderAuthors(authors) {
    if (!authors) return null
    return authors.map(author => createHTML(author))
}


export function createHTML(author) {
    return `<tr id="author-${author.id}">
    <td class="border px-8 py-4">${author.fullName}</td>
    <td class="border px-8 py-4">${author.description}</td>
    <td class="border px-8 py-4">${author.country}</td>
    <td class="border px-8 py-4"><a class="hover:underline" href="/authors/${author.id}">Show</a></td>
    <td class="border px-8 py-4"><a class="hover:underline" href="/authors/${author.id}/edit">Edit</a></td>
    <td class="border px-8 py-4"><a class="author_delete hover:underline" href="/authors/${author.id}">Destroy</a></td>
    </tr>`
}

