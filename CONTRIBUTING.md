
**El archivo CONTRIBUTING.md del repositorio reúne las reglas que todo el equipo sigue; Black y Pylint las verifican de forma automática antes de cada pull request.

| Tema                     | Regla                                                                                                                                                                   |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Nomenclatura             | Funciones y variables ensnake_case, clases enPascalCase, constantes enMAYUSCULAS_CON_GUION_BAJO. Nombres en español, claros y sin abreviaturas (saldo_pendiente, nosp) |
| Indentación y formato   | 4 espacios, sin tabuladores. Líneas de hasta 88 caracteres. Black da el formato y Pylint revisa el estilo                                                              |
| Longitud de funciones    | Máximo 30 líneas; si una función hace más de una cosa, se divide                                                                                                    |
| Comentarios y docstrings | Toda función, clase y módulo público lleva docstring conArgs,ReturnsyRaises. Los comentarios explican el porqué, no lo que ya dice el código                       |
| Base de datos            | Tablas y columnas ensnake_casey en singular (cliente,orden_trabajo). Consultas siempre parametrizadas                                                                   |
| Secretos                 | Contraseñas y claves van en.env, nunca en el código ni en el repositorio                                                                                              |
| Commits y ramas          | Los de la sección 3                                                                                                                                                    |

Estructura de carpetas

paesa/

├── manage.py

├── requirements.txt

├── .env.example

├── README.md

├── CONTRIBUTING.md

├── docs/

│   └── arquitectura/

├── portafolio/

│   └── A11/

├── paesa/            # configuración del proyecto Django

├── clientes/         # app: clientes e historial

├── cotizaciones/     # app: cotizaciones y seguimiento

├── ordenes/          # app: órdenes de trabajo y material usado

├── pagos/            # app: anticipos, pagos y saldos

├── materiales/       # app: catálogo de materiales

└── tests/

Plantilla del README: nombre del proyecto, descripción de una frase, requisitos, pasos de instalación, cómo ejecutar el sistema, cómo correr las pruebas, estructura de carpetas, integrantes y enlace a CONTRIBUTING.md.

Definición de Terminado técnica. Una historia de usuario está terminada cuando: pasa Black y Pylint, las funciones públicas tienen docstring, tiene al menos una prueba que pasa, el pull request fue revisado y aprobado por otro integrante, y la función corre en el entorno de desarrollo sin errores.

**
