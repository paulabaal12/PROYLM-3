import subprocess

def execute_prolog(query, prolog_script):
    #Se realiza la consulta a Prolog
    formatted_query = f"{query}, write(D), nl."

    try:
        #Se ejecuta el comando SWI-Prolog mediante el módulo de subprocess
        process = subprocess.Popen(['swipl', '-q', '-s', prolog_script, '-g', formatted_query, '-t', 'halt'],
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout_data, stderr_data = process.communicate()

        # Se decodifican los resultados y errores obtenidos
        decoded_output = stdout_data.decode('utf-8').strip()
        decoded_error = stderr_data.decode('utf-8').strip()

        if decoded_error:
            raise Exception(f"Prolog Error: {decoded_error}")
        if not decoded_output:
            raise Exception("No result returned from Prolog.")

        return decoded_output

    except Exception as e:
        print(f"An error occurred: {e}")
        return None


def process_functions(functions_file, prolog_script):
    try:
        with open(functions_file, 'r') as f:
            func_number = 1  
            for func in f:
                func = func.strip() 
                if func:
                    print(f"Function #{func_number}")
                    print("-" * 50)  
                    print(f"Processing function: {func}")
                    result = execute_prolog(f"derivada({func}, x, D)", prolog_script)
                    if result:
                        print(f"Derivative: {result}")
                    else:
                        print("An error occurred while processing the function.")
                    print("\n")
                    func_number += 1
    except FileNotFoundError:
        print(f"The file {functions_file} was not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
process_functions('funciones.txt', 'derivadas.pl')