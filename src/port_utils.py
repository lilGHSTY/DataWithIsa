"""
Port selection utilities for Web Starter Kit projects.
Ensures each project gets a consistent, conflict-free port.
"""

import hashlib
import socket
import os


def select_project_port(project_name=None):
    """
    Smart port selection for the project.
    
    Args:
        project_name (str): Project name (defaults to current directory name)
        
    Returns:
        int: Available port number
    """
    if project_name is None:
        project_name = os.path.basename(os.getcwd())
    
    # Method 1: Deterministic based on project name
    base_hash = int(hashlib.md5(project_name.lower().encode()).hexdigest()[:4], 16)
    suggested_port = 5000 + (base_hash % 1000)
    
    # Method 2: Check if suggested port is available
    if is_port_available(suggested_port):
        return suggested_port
    
    # Method 3: Find next available port in range
    for offset in range(1, 100):
        alternative_port = 5000 + ((base_hash + offset) % 1000)
        if is_port_available(alternative_port):
            return alternative_port
    
    # Fallback: Find any available port in Flask's default range
    return find_random_available_port()


def is_port_available(port):
    """
    Check if a port is available for binding.
    
    Args:
        port (int): Port number to check
        
    Returns:
        bool: True if port is available
    """
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind(('localhost', port))
            return True
    except OSError:
        return False


def find_random_available_port(start_port=5000, max_attempts=100):
    """
    Find any available port starting from start_port.
    
    Args:
        start_port (int): Starting port to search from
        max_attempts (int): Maximum ports to try
        
    Returns:
        int: Available port number
        
    Raises:
        RuntimeError: If no free ports found
    """
    for port in range(start_port, start_port + max_attempts):
        if is_port_available(port):
            return port
    
    raise RuntimeError(f"No free ports found in range {start_port}-{start_port + max_attempts}")


def get_project_port_from_env():
    """
    Get port from environment variable, with fallback to auto-selection.
    
    Returns:
        int: Port number to use
    """
    # Try to get from environment first
    port_env = os.getenv('PORT')
    if port_env:
        try:
            port = int(port_env)
            if is_port_available(port):
                return port
            else:
                print(f"Warning: Port {port} from environment is not available")
        except ValueError:
            print(f"Warning: Invalid port in environment: {port_env}")
    
    # Fallback to auto-selection
    return select_project_port()


if __name__ == "__main__":
    # Test the port selection
    project_name = os.path.basename(os.getcwd())
    port = select_project_port()
    print(f"Selected port {port} for project '{project_name}'")
    print(f"Port {port} available: {is_port_available(port)}")