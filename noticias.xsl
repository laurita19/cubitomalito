<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="icon" href="img/logo.png" type="image/x-icon"/>
        <title>Noticias</title>
    </head>
    <body class="w-screen h-full m-0 p-0 md:flex md:flex-row">
        <header class="w-full h-10 bg-[#1d1d1b] md:w-1/4 md:h-screen md:flex md:flex-col items-center">
            <div class="w-full h-full md:h-1/5 flex flex-row justify-center pt-1 md:flex-col md:items-center md:p-5 md:mt-10">
                <a href="index.html"><img src="img/logo.png" alt="" class="w-8 h-8 ml-5 mr-2 md:h-16 md:w-16 md:m-none"/></a>
                <h1 class="hidden text-4xl font-extrabold text-[#ffff09] text-center md:block">Counter Strike League</h1>
    
                <h1 class="text-xl font-extrabold text-[#ffff09] text-center md:hidden">CSL</h1>
                <div class="hidden w-11/12 h-px bg-gray-600 mt-4 text-[#1d1d1b] md:block">-----------</div>
                <div id="hamburger-container" class="w-full h-full flex justify-end md:hidden" data-selected="false">
                    <div id="hamburger" class="w-8 mt-1">
                        <div class="w-6 h-1 bg-[#ffff09] mb-1"></div>
                        <div class="w-6 h-1 bg-[#ffff09] mb-1"></div>
                        <div class="w-6 h-1 bg-[#ffff09] mb-1"></div>
                    </div>
                </div>
            </div>
    
            <nav id="nav" class="hidden z-50 h-full w-full absolute md:static bg-opacity-80 md:bg-opacity-100 bg-black md:w-11/12 md:h-full md:p-5 :mt-10 flex flex-col flex-wrap justify-center md:bg-[#1d1d1b] md:justify-start md:z-0 md:block">
                <ul class="ml-5 md:ml-none">
                    <!-- Opciones de navegación -->
                    <li class="text-2xl text-white font-bold my-4">Temporada 2023</li>
                    <a href=""><li class="text-2xl text-[#ffff09] font-bold my-4">Noticias</li></a>
                    <a href=""><li class="text-2xl text-[#ffff09] font-bold my-4">Clasificación</li></a>
                    <a href=""><li class="text-2xl text-[#ffff09] font-bold my-4">Calendario</li></a>
                </ul>
                <!-- Enlace para añadir noticia -->
                <button id="openAddNoticiaModal" class="fixed bottom-10 right-10 bg-[#ffff09] text-gray-900 px-4 py-2 rounded-full shadow-md focus:outline-none">
                    + Añadir Noticia
                </button>
            </nav>
        </header>

        <main class="w-full h-screen m-0 p-0 bg-red-400 bg-[url('img/fondo2.jpg')] bg-cover bg-no-repeat bg-local overflow-y-scroll flex items-center flex-col">
            <section class="">
                <!-- Sección banner -->
            </section>
            <section class="w-full h-full flex flex-col items-center bg-[url('img/trophie.jpg')] bg-cover bg-no-repeat bg-local bg-opacity-10 md:w-10/12 overflow-hidden">
                <!-- Contenido de la sección de noticias -->
                <div class="w-full h-auto sm:h-auto bg-[#ffff09] flex flex-nowrap flex-col sm:flex-row">
                    <img src="img/scope.svg" alt="" class="hidden w-8 md:block"/>
                    <div class="w-full md:w-3/4 h-full ml-1">
                        <h1 class="text-3xl font-extrabold">Noticias</h1>
                    </div>
                </div>
                <div class="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 mt-4 px-4">
                    <!-- Aquí se generarán las noticias -->
                    <xsl:apply-templates select="noticias/noticia"/>
                </div>
            </section>
            <!-- Modal para añadir noticia -->
            <div id="modalAddNoticia" class="fixed inset-0 z-50 hidden overflow-y-auto">
                <div class="flex items-center justify-center min-h-screen">
                    <div class="fixed inset-0 bg-gray-900 bg-opacity-50 transition-opacity" aria-hidden="true"></div>
                    <!-- Contenido del modal -->
                    <div class="bg-[#1d1d1b] bg-opacity-90 rounded-lg p-8 max-w-sm mx-auto z-50">
                        <div class="flex justify-between items-center mb-6">
                            <h2 class="text-2xl font-bold text-[#ffff09]">Añadir Noticia</h2>
                            <button id="closeAddNoticiaModal" class="text-gray-600 hover:text-gray-800 focus:outline-none">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                </svg>
                            </button>
                        </div>
                        <!-- Formulario de añadir noticia -->
                        <form id="addNoticiaForm" action="guardar_noticia.php" method="post" enctype="multipart/form-data">
                            <div class="mb-4">
                                <label for="titulo" class="block text-sm font-medium text-gray-700">Título</label>
                                <input type="text" name="titulo" id="titulo" required="required" class="mt-1 focus:ring-[#ffff09] focus:border-[#ffff09] block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"/>
                            </div>
                            <div class="mb-4">
                                <label for="contenido" class="block text-sm font-medium text-gray-700">Contenido</label>
                                <textarea name="contenido" id="contenido" required="required" class="mt-1 focus:ring-[#ffff09] focus:border-[#ffff09] block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"></textarea>
                            </div>
                            <div class="mb-4">
                                <label for="imagen" class="block text-sm font-medium text-gray-700">Imagen</label>
                                <input type="file" name="imagen" id="imagen" accept="image/*" required="required" class="mt-1 focus:ring-[#ffff09] focus:border-[#ffff09] block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"/>
                                <p class="text-xs text-gray-500 mt-1">Seleccione una imagen para cargar.</p>
                            </div>
                            <div class="flex items-center justify-between">
                                <div>
                                    <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-base font-medium text-gray-900 bg-[#ffff09] hover:bg-yellow-400 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#ffff09]">
                                        Añadir Noticia
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <script src="js/modalnoti.js"></script>
        <script src="mandarphp.js"></script>
    </body>
    </html>
  </xsl:template>
  
  <xsl:template match="noticia">
    <!-- Plantilla para cada noticia -->
    <div class="bg-white rounded-lg shadow-md p-4">
        <img src="{imagen}" alt="{titulo}" class="w-full h-40 object-cover rounded-lg mb-4"/>
        <h2 class="text-xl font-bold mb-2">
            <xsl:value-of select="titulo"/>
        </h2>
        <p class="text-gray-700">
            <xsl:value-of select="descripcion"/>
        </p>
        <a href="#" class="text-[#ffff09] font-semibold mt-2 inline-block hover:underline">Leer más</a>
    </div>
  </xsl:template>
</xsl:stylesheet>
