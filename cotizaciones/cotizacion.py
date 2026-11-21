from tkinter import * 
from tkinter import messagebox
import tkinter as tk
from tkinter import ttk 
from clientes import clientesbd
from tkcalendar import DateEntry
from cotizaciones import cotizacionbd
from materiales import materialesbd

from materiales.materilaes import MaterialesMVC

class CotizacionesMVC():
    def __init__(self, ventana, funcionMenu):
        self.ventana = ventana
        self.crearMenuSuperior = funcionMenu
        self.ventana.geometry("800x600")
        self.mostrarCotizacionesView()
    def borrarPantalla(self):
        for widget in self.ventana.winfo_children():
            widget.destroy()
    ##par llamar y tener conexion con el modulo de materiales
    def irAMaterialesMVC(self,tipo):
        MaterialesMVC(self.ventana, self.crear_menu_superior,tipo)
        

    def mostrarCotizacionesView(self):
        self.borrarPantalla()
        contenedor = tk.Frame(self.ventana)
        contenedor.pack(fill="both", expand=True)

        self.crearMenuSuperior(contenedor)
        frame_principal = tk.Frame(contenedor)
        frame_principal.pack(fill="both", expand=True, padx=10, pady=10)
        frame_principal.grid_columnconfigure(0, weight=1, uniform="mitad")
        frame_principal.grid_columnconfigure(1, weight=1, uniform="mitad")
        frame_principal.grid_rowconfigure(0, weight=1)

        frame_izq = tk.Frame(frame_principal)
        frame_izq.grid(row=0, column=0, sticky="nsew", padx=(0, 5))

        Label(frame_izq, text="Cotizacion", font=("Arial", 12, "bold")).pack(anchor="w", pady=5)
        
        frame_tabla_cot = tk.Frame(frame_izq)
        frame_tabla_cot.pack(fill="both", expand=True, pady=5)
        
        columnas_cot = ("Id", "Cliente", "Total", "Descrip.", "Material")
        tabla_cot = ttk.Treeview(frame_tabla_cot, columns=columnas_cot, show="headings")
        

        datos_cot = self.mostrarCotizacionesController() 
        
        for col in columnas_cot:
            tabla_cot.heading(col, text=col)
            tabla_cot.column(col, width=70)
            
        if datos_cot:
            for item in datos_cot:
                tabla_cot.insert("", tk.END, values=item)
                
        tabla_cot.pack(side="top", fill="both", expand=True)
        tabla_cot.bind("<<TreeviewSelect>>", self.alSeleccionarCotizacion)
        
        # Botones de Cotizaciones
        frame_botones_cot = tk.Frame(frame_izq)
        frame_botones_cot.pack(fill="x", pady=10)
        
        Button(frame_botones_cot, text="Agregar", command="").pack(side="right", padx=5)

        self.btnEditarCot = Button(frame_botones_cot, text="Editar", command="")
        self.btnEditarCot.pack(side="right", padx=5)
        self.btnEditarCot.config(state=tk.DISABLED)
#
        frame_der = tk.Frame(frame_principal)
        frame_der.grid(row=0, column=1, sticky="nsew", padx=(5, 0))

        Label(frame_der, text="materiales", font=("Arial", 12, "bold")).pack(anchor="w", pady=5)
        
        frame_tabla_mat = tk.Frame(frame_der)
        frame_tabla_mat.pack(fill="both", expand=True, pady=5)
        
        columnas_mat = ("ID", "Material", "Descrip.", "Can.", "Prec", "Total")
        self.tabla_mat = ttk.Treeview(frame_tabla_mat, columns=columnas_mat, show="headings")
        
        datos_mat = self.mostrarMaterialesController() 
        
        for col in columnas_mat:
            self.tabla_mat.heading(col, text=col)
            self.tabla_mat.column(col, width=65)
            
        if datos_mat:
            for item in datos_mat:
                self.tabla_mat.insert("", tk.END, values=item)
                
        self.tabla_mat.pack(side="top", fill="both", expand=True)
        self.tabla_mat.bind("<<TreeviewSelect>>", self.alSeleccionarMaterial)
        
        # Botones de Materiales
        frame_botones_mat = tk.Frame(frame_der)
        frame_botones_mat.pack(fill="x", pady=10)
        
       
        self.btnAgregarMat = Button(frame_botones_mat, text="Agregar", command=lambda: self.irAMaterialesMVC("agregar"))
        self.btnAgregarMat.pack(side="right", padx=5)
        self.btnAgregarMat.config(state=tk.DISABLED)

        self.btnEditarMat = Button(frame_botones_mat, text="Editar", command=None)
        self.btnEditarMat.pack(side="right", padx=5)
        self.btnEditarMat.config(state=tk.DISABLED)
    def agregarCotizacion(self):
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
        Label(frame_form, text="DATOS DE LA COTIZACIÓN", font=("Arial", 11, "bold")).pack(pady=5)
        Label(frame_form, text="ingrese el nombre del cliente").pack(anchor="w", pady=2, padx=10)
        self.nombre = Entry(frame_form, width=40)
        self.nombre.focus()
        self.nombre.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese el telefono del cliente").pack(anchor="w", pady=2, padx=10)
        self.telefono = Entry(frame_form, width=40)
        self.telefono.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese el email del cliente").pack(anchor="w", pady=2, padx=10)
        self.email = Entry(frame_form, width=40)
        self.email.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="calle:").pack(anchor="w", pady=2, padx=10)
        self.calle = Entry(frame_form, width=40)
        self.calle.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="numero").pack(anchor="w", pady=2, padx=10)
        self.numero = Entry(frame_form, width=40)
        self.numero.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="colonia").pack(anchor="w", pady=2, padx=10)
        self.colonia = Entry(frame_form, width=40)
        self.colonia.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese la RFC del cliente").pack(anchor="w", pady=2, padx=10)
        self.rfc = Entry(frame_form, width=40)
        self.rfc.pack(fill="x", pady=2, padx=10)       
        
        Label(frame_form, text="ingrese la fecha de registro del cliente").pack(anchor="w", pady=2, padx=10)
        self.registro = DateEntry(frame_form, selectmode='day')
        self.registro.pack(fill="x", pady=2, padx=10)
        
        Label(frame_form, text="ingrese el estatus del cliente").pack(anchor="w", pady=2, padx=10)
        datos = ("activo", "inactivo")
        self.estatus = ttk.Combobox(frame_form, values=datos, state="readonly")
        self.estatus.pack(fill="x", pady=2, padx=10)
        self.estatus.current(0)      
        
        frame_botones = tk.Frame(frame_form)
        frame_botones.pack(pady=15)
        Button(frame_botones, text='agregar', command=self.ejecutarTodoIns).pack(side="left", padx=5)
        Button(frame_botones, text='::Regresar::', command=self.mostrarClientesView).pack(side="left", padx=5)
    def alSeleccionarCotizacion(self, event):
        seleccion = event.widget.selection()
        if seleccion:
            valores = event.widget.item(seleccion[0], "values")
            self.id_cot_seleccionado = valores[0]
            self.btnEditarCot.config(state="normal")
            self.btnAgregarMat.config(state="normal")
            for fila in self.tabla_mat.get_children():
                self.tabla_mat.delete(fila)
            materiales = self.buscarMaterialesPorId(self.id_cot_seleccionado)
            if materiales:
                for mat in materiales:
                    self.tabla_mat.insert("", tk.END, values=mat)
    def alSeleccionarMaterial(self, event):
        seleccion = event.widget.selection()
        if seleccion:
            valores = event.widget.item(seleccion[0], "values")
            self.id_mat_seleccionado = valores[0]
            self.btnEditarMat.config(state="normal")

    #controladores

    def mostrarCotizacionesController (self):
        return cotizacionbd.Cotizaciones.consultarCot()
    def buscarMaterialesPorId(self, id):
        print("Buscando materiales para la cotización con ID:", id)
        materiales = materialesbd.Materiales.consultarId(id)

        if not materiales:
                    return []
        materiales_con_total = []
        for fila in materiales:
            precio_u = float(fila[4])
            cantidad = float(fila[5])
            total = precio_u * cantidad
            fila_formateada = (fila[0], fila[1], fila[2], fila[5], fila[4], total,
            )
            materiales_con_total.append(fila_formateada)

        return materiales_con_total
    def mostrarMaterialesController(self):
        pass

