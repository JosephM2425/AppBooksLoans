export default function index(){
    const authors = document.querySelector('#authors')
    if (!authors) return null

    fetch('/authors', {
        method: 'GET',
        headers: {'Accept': 'application/json'}
    })
    .then(response => response.json())
    .then(authors => renderAuthors(authors))
    .then(authors_arr => authors.querySelector('tbody').innerHTML = authors_arr.join('')  )
}


function renderAuthors(authors) {
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

