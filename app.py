import os
from logging import getLogger

from fastapi import FastAPI

logger = getLogger(__name__)

app = FastAPI(
    title="teplate model",
    description="template",
    version="0.0.1",
)
