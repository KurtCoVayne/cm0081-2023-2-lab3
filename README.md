# John Alejandro Gonzalez - Luis Alejandro Baena

## Detalles técnicos:
```
Sistema operativo 'MacOS Sonoma' versión 14.1.1
Kernel versión 'Darwin23.1.0'.
Compilador clang versión 'clang-15.0.0'
Herramienta llvm versión 'llvm-16.0.0'.
Administrador de paquetes OPAM '2.1.5'.
Lenguaje formal Coq '8.15.2'.
Compilador Ocaml versión '4.13.1'.
Control de ejecutables GNU make '3.81'.
```

## Instalación de herramientas

Las instrucciones que se encuentran en el repositorio de VeLLVM [vellvm](https://github.com/vellvm/vellvm) son muy claras, sin embargo, hay que seguirlas en un orden distinto al que se presentan. Aquí está el orden para instalar VeLLVM:

1. Instalar **OPAM** [opam](https://opam.ocaml.org/) (Ocaml Package Manager) con el gestor de paquetes en su sistema operativo, en nuestro caso **Homebrew** [homebrew](https://brew.sh/) con el comando `brew install opam`.
2. Inicializar **OPAM** con el comando `opam init`.
3. Agregar el repositorio de Coq con el comando `opam repo add coq-released https://coq.inria.fr/opam/released`.
4. Crear un Switch para la instalación de VeLLVM con el comando `opam switch create vellvm ocaml-base-compiler.4.13.1`.
5. Clonar el repositorio y los submódulos con el comando `git clone --recurse-submodules git@github.com:kurtcovayne/cm0081-2023-2-lab3.git`.
6. Ingresar al directorio src con el comando `cd cm0081-2023-2-lab3/vellvm/src`.
7. Instalar las dependencias con el comando `make opam`.
8. Para compilar, hubo muchos problemas, pues parece que el `make` no está compilando las cosas en orden. Lo que nos sirvió para arreglar esto fue ejecutar varias veces el comando `make -j<n>`, donde `n` es el número de procesadores, e ir aumentando el valor de `n` en caso de que falle. En nuestro caso, `n` llegó a ser 24.

## Verificación de programas en representación intermedia de LLVM

Para verificar un programa en representación intermedia de LLVM, se deben seguir los siguientes pasos:

1. Crear un archivo con extensión `.ll` con el código en representación intermedia de LLVM.
2. Compilar el archivo `.ll` con el comando `clang -S -emit-llvm -o <nombre de archivo de salida> <nombre de archivo de entrada>`.
3. Tuvimos problemas en MacOS Sonoma, ya que `clang` agrega modificadores a los parámetros cuando ejecuta la instrucción `call`. También, LLVM agrega modificadores a los bucles y VeLLVM no logra reconocerlos, por lo que se debe corregir el archivo `.ll` para que no tenga estos modificadores.
4. Agregar comandos de verificación al archivo `.ll`.
5. Ejecutar el comando `./vellvm --test-file <nombre de archivo de entrada>`.
