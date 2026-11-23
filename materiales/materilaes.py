from tkinter import * 
from tkinter import messagebox
import tkinter as tk
from tkinter import ttk 
from clientes import clientesbd
from tkcalendar import DateEntry
from cotizaciones import cotizacionbd
from materiales import materialesbd
class MaterialesMVC():
    def __init__(self, ventana, funcionMenu,tipo):
        self.ventana = ventana
        self.crearMenuSuperior = funcionMenu
        self.tipo = tipo
        self.ventana.geometry("800x600")
        if self.tipo == "agregar":
            self.agregarMaterialesView()

    def borrarPantalla(self):
        for widget in self.ventana.winfo_children():
            widget.destroy()

    def agregarMaterialesView (self):
        self.borrarPantalla()
        contenedor = tk.Frame(self.ventana)
        contenedor.pack(fill="both", expand=True)
        self.crearMenuSuperior(contenedor)

        # --- CONFIGURACIÓN DEL SCROLL ---
        canvas = tk.Canvas(contenedor)
        barra = tk.Scrollbar(contenedor, orient="vertical", command=canvas.yview)
        
        frame_form = tk.Frame(canvas)
        frame_form.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )
        canvas.create_window((0, 0), window=frame_form, anchor="nw")
        canvas.configure(yscrollcommand=barra.set)
        canvas.pack(side="left", fill="both", expand=True)
        barra.pack(side="right", fill="y")
        # ---------------------------------

        Label(frame_form, text="DATOS DE LOS MATERIALES", font=("Arial", 11, "bold")).pack(pady=5)
        Label(frame_form, text="ingrese el nombre del material").pack(anchor="w", pady=2, padx=10)
        self.nombre = Entry(frame_form, width=40)
        self.nombre.focus()
        self.nombre.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese la descripción del material").pack(anchor="w", pady=2, padx=10)
        self.descripcion = Entry(frame_form, width=40)
        self.descripcion.pack(fill="x", pady=2, padx=10)

        Label(frame_form, text="medida:").pack(anchor="w", pady=2, padx=10)
        self.medida = Entry(frame_form, width=40)
        self.medida.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese el precio del material").pack(anchor="w", pady=2, padx=10)
        self.precio = Entry(frame_form, width=40)
        self.precio.pack(fill="x", pady=2, padx=10)
        

        datos = revisadosDatos()
        Label(self.ventana, text="ingresar el id del coche que deseas borrar").pack(pady=10)
        datos = self.revisarId()
        self.idBorrar = ttk.Combobox(self.ventana,values=datos,state="readonly")
        self.idBorrar.pack(pady=5)
        self.idBorrar.current(0)
        
        frame_botones = tk.Frame(frame_form)
        frame_botones.pack(pady=15)
        Button(frame_botones, text='agregar', command=self.ejecutarTodoIns).pack(side="left", padx=5)
        Button(frame_botones, text='::Regresar::', command=self.mostrarClientesView).pack(side="left", padx=5)






        #controladores
        def revisadosDatos (self):
            datos = materialesbd.MaterialesBD().obtenerDatos()
            datosnuevos = [datos[0] + " " + datos[1]]

