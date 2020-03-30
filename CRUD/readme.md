# Sistema CRUD Laravel / VueJS
El sistema actual está basado en el framework Laravel, se encuentra elaborado siguiendo las convenciones del framework por lo que encontraremos siguientes elementos:
## URL
El proyecto se encuentra desplegado en la siguiente dirección:
www.primermaster.net

## Migrations
Se ha creado la migración para la tabla *pages* que contendra cada una de las paginas del sitio web, a continuación su estructura:

`Schema::create('pages', function (Blueprint $table) {
    $table->increments('id');
    $table->string('title');
    $table->string('slug');
    $table->text('description');
    $table->text('body');
    $table->string('anterior')->nullable();
    $table->string('siguiente')->nullable();
    $table->timestamps();
});`
## Seeders
Los *Seeders* aportan información a la base de datos, regularmente contienen aquellos datos mínimos para que el sistema funciones, por ejemplo:
- Catálogos por defecto
- Datos de prueba
- Usuario por defecto

En el proyecto actual, la clase *PagesSeeder* tiene el siguiente aspecto:

`[
  'title' => 'PrimerMaster',
  'slug' => str_slug('inicio'),
  'description' => 'Somos una empresa de consultoria informatica',
  'body' => 'Hola, Bienvenido a PrimerMaster <br>
  Gracias por visitarnos, estamos creando contenido interesante para tí. <br>
  Por favor regresa pronto.',
  'anterior' => '',
  'siguiente' => 'acerca',
  'created_at' => now()
],`

## Models
Por defecto se encuentra declarado el modelo *User*, ademas se ha creado el modelo *Page* que sera el encargado de manejar cada una de las páginas del sitio web, como ha sido declarado de acuerdo a las convenciones solo se han especificado los elementos rellenables con el siguiente arreglo:

`protected $fillable = [
    'title', 'slug', 'description','body','anterior','siguiente'
];`

## Controllers
En la parte de controladores solo se ha creado uno, *PagesController*, este sera el encargado de realizar el proceso CRUD de nuestro sistema, mismo que opera con verbos http y es aquí donde hacemos uso del ORM para gestionar los datos persistentes, como se muestra a continuación:

`public function update(Request $request, $slug){

  $data=$request->input('data');

  $page= Page::find($data['id']);

  $page->title=$data['title'];
  $page->slug=$data['slug'];
  $page->description=$data['description'];
  $page->body=$data['body'];
  $page->anterior=$data['anterior'];
  $page->siguiente=$data['siguiente'];
  $page->save();
  return $page;
}`

## Routes
La gestión de rutas se lleva a cabo por una parte con ayuda de Laravel, las rutas *web* se redireccionan a Vue Router mientras que para la gestión de recurso se utilizan las rutas *api* como se muestra a continuación:
`Route::get('pages/{slug}', 'PagesController@show');
Route::put('pages/{slug}', 'PagesController@update');`

Por su parte el archivo de rutas de Vue tiene el siguiente aspecto:
`export default new Router({
  routes:[
    {
      path: '/', redirect:  '/public/inicio'
    },
    {
      path:'/public/:slug',
      name:'public',
      component:require('./views/seccion.vue').default,
      props:true
    },`
## Carga Asíncrona
La carga se manipula por medio de *Axios* de esta forma evitamos la carga completa de la página, la función para obtener los datos es la siguiente:
`axios.get(slug).then( res =>{
  this.data = res.data
})`

## Mejoras Futuras
Se espera corregir el nombre le la vista *seccion* a *page* para que coincida con la semántica, ademas, es indispensable restringir la vista *edit/{slug}* a solo usuarios con privilegios.
