from conexionbd import conexion,cursor
from datetime import date, datetime, timedelta
class Materiales():
    def __init__(self,nombre,descripcion, medida, precioU, cantidad, comprado,cotizacion):
        self._nombre = nombre
        self._descripcion = descripcion
        self._medida = medida
        self._precioU = precioU 
        self._cantidad = cantidad
        self._comprado = comprado
        self._cotizacion = cotizacion
    def insertar(self):
        try:
            sql = "INSERT INTO materiales VALUES (null, %s, %s, %s, %s, %s, %s, %s, %s)"
            valores = (self._nombre, self._descripcion, self._medida, self._precioU, self._cantidad, self._comprado, self._cotizacion,)
            cursor.execute(sql, valores)
            conexion.commit()
            return True
        except Exception as e:
            print(f"Error detallado en SQL: {e}") 
            return False
    @staticmethod
    def consultar():
        try:
            sql = "select * from materiales"
            cursor.execute(sql,)
            return cursor.fetchall()
        except:
            return []
    @staticmethod
    def consultarId(id: int):
        try:
            sql = "select id, nombre, descrpcion, medida, precioU, cantidad comprado from materiales where cotizacion = %s"
            cursor.execute(sql, (id,))
            return cursor.fetchall()
        except:
            return []
    @staticmethod
    def consultarCotId():
        try:
            sql = "select numCotizacion  from cotizaciones where estado = 'aceptado'"
            cursor.execute(sql,)
            return cursor.fetchall()
        except Exception as e:
            print(f"Error detallado en SQL: {e}") 
            return False
    @staticmethod
    def consultarPorID(id):
        try:
            sql = "select * from materiales where id = %s"
            valores = (id,)
            cursor.execute(sql, valores)
            return cursor.fetchone()
        except:
            return []
    @staticmethod
    def matID(id):
        try:
            sql = "select id, nombre, descrpcion, medida, precioU, cantidad, comprado from materiales where cotizacion = %s"
            valores = (id,)
            cursor.execute(sql, valores)
            return cursor.fetchall()
        except:
            return []
    @staticmethod
    def eliminar(id: int):
        try:
            sql = "delete from materiales where id= %s "
            valores =  (id,)
            cursor.execute(sql,valores)
            conexion.commit()
            return True
        except:
            return False
    def actualizar(self, id):
        try:
            
            sql = "UPDATE materiales SET nombre = %s, descrpcion = %s, medida = %s, precioU = %s, cantidad = %s WHERE id = %s"
            valores = (self._nombre, self._descripcion, self._medida, self._precioU, self._cantidad, id)
            cursor.execute(sql, valores)
            conexion.commit()
            return True
        except Exception as e:
            print(f"Error al actualizar: {e}")
            return False
    @staticmethod
    def obtenerDatos():
        try:
            sql = "SELECT id, nombre, apellido1 FROM trabajadores"
            cursor.execute(sql)
            return cursor.fetchall()
        except Exception as e:
            print(f"Error al obtener datos: {e}")
            return []

    @staticmethod
    def marcarAceptada(num_cot: int):
        try:
            sql = """
            UPDATE materiales
            SET comprado = IF(comprado = 1, 0, 1)
            WHERE id = %s
            """
            cursor.execute(sql, (num_cot,))
            conexion.commit()
            return True
        except Exception as e:
            conexion.rollback()
            print("Error en alternarComprado:", e)
            return False
    @staticmethod
    def cambiarAprobado (num_cot):

        try:
            sql_cot = """
            UPDATE cotizaciones
            SET estado = 'en proceso'
            WHERE numCotizacion = %s
            """
            cursor.execute(sql_cot, (num_cot,))

            sql_proyecto = """
            INSERT INTO proyectos (
                fechaInicio,
                fechaFinal,
                cometarios,
                estatus,
                ordenProyecto,
                estatusCob,
                fechaEntreg,
                fechaPago,
                totalPagar
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            valores_proyecto = (
                date.today(),
                "0000-00-00",
                None,
                "Por Empezar",
                num_cot,
                "sin pago",
                "0000-00-00",
                "0000-00-00",
                0,
            )
            cursor.execute(sql_proyecto, valores_proyecto)

            conexion.commit()
            return True
        except Exception as e:
            conexion.rollback()
            print(f"Error al actualizar: {e}")
            return False


    #set y get`
    #get
    @property
    def nombre(self):
        return self.nombre
    @property
    def descripcion(self):
        return self.descripcion
    @property
    def medida(self):
        return self._medida
    @property
    def precioU(self):
        return self.precioU
    @property
    def comprado(self):
        return self._comprado
    @property
    def cotizacion(self):
        return self._cotizacion
    ##set
    @nombre.setter
    def nombre (self,nombre):
        self.nombre = nombre
    @descripcion.setter
    def descripcion (self,descripcion):
        self.descripcion = descripcion
    @medida.setter
    def medida (self, medida):
        self._medida = medida
    @precioU.setter 
    def precioU (self,precioU):
        self._precioU = precioU
    @comprado.setter
    def comprado(self, comprado):
        self._comprado = comprado
    @cotizacion.setter
    def cotizacion (self, cotizacion):
        self._cotizacion = cotizacion
