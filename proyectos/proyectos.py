from tkinter import * 
from tkinter import messagebox
import tkinter as tk
from tkinter import ttk 
from clientes import clientesbd
from tkcalendar import DateEntry
from cotizaciones import cotizacionbd
from materiales import materialesbd
class ProyectosMVC():  
    def __init__(self, ventana, funcionMenu, ):
        self.ventana = ventana
        self.crearMenuSuperior = funcionMenu
        self.ventana.geometry("800x600")
        self.mostrarProyectosView()

    def mostrarProyectosView (self):
        self.borrarPantalla()
        contenedor = tk.Frame(self.ventana)
        contenedor.pack(fill="both", expand=True)
        self.crearMenuSuperior(contenedor)
        Label(contenedor, text="Proyectos").pack(anchor="w", padx=10, pady=5)
        frame_tabla = tk.Frame(contenedor)
        frame_tabla.pack(fill="both", expand=True, padx=10, pady=5)
        columnas = ("id", " Presupuesto", "total", "inicio","estatus", "dias retraso", "fin","comentarios", )
        tabla = ttk.Treeview(frame_tabla, columns=columnas, show="headings")
        datos = self.mostrarproyectosController()
        for col in columnas:
            tabla.heading(col, text=col)
            tabla.column(col, width=80)
        if datos:
            for trabajador in datos:
                tabla.insert("", tk.END, values=trabajador)
        tabla.pack(side="top", fill="both", expand=True)
        tabla.bind("<<TreeviewSelect>>", self.alSeleccionar) 
        frame_botones = tk.Frame(contenedor)
        frame_botones.pack(fill="x", padx=10, pady=10)
        Button(frame_botones, text="agregar", command=self.agregarTrabajadoresView).pack(side="right", padx=5)
        self.ButtonEditar = Button(frame_botones, text="Editar", command=self.editarTrabajadoresView)
        self.ButtonEditar.pack(side="right", padx=5)
        self.ButtonEditar.config(state=tk.DISABLED)