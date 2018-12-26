from flask import Flask, request, json, render_template, make_response, session,redirect, url_for
from flask_sqlalchemy import SQLAlchemy
import datetime
from flask_restful import marshal, fields
from flask_cors import CORS
from random import randint
import os