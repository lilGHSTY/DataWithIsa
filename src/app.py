from flask import Flask, render_template, jsonify
from dotenv import load_dotenv
from port_utils import get_project_port_from_env
import os

# Load environment variables
load_dotenv()

# Initialize Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'sqlite:///development.db')

# Routes
@app.route('/')
def index():
    """Landing page for DataWithIsa"""
    return render_template('index.html')

@app.route('/about')
def about():
    """About Isa page"""
    return render_template('about.html')

@app.route('/examples')
def examples():
    """Example dashboards showcase"""
    return render_template('examples.html')

@app.route('/contact')
def contact():
    """Contact page"""
    return render_template('contact.html')

@app.route('/health')
def health():
    """Health check endpoint"""
    return jsonify({'status': 'healthy', 'service': 'DataWithIsa'}), 200

# Error handlers
@app.errorhandler(404)
def not_found(error):
    return render_template('404.html'), 404

@app.errorhandler(500)
def internal_error(error):
    return render_template('500.html'), 500

if __name__ == '__main__':
    port = get_project_port_from_env()
    print(f"Starting DataWithIsa server on port {port}")
    app.run(host='0.0.0.0', port=port, debug=True)