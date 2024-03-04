from vpalette import get_colors
from prefect import flow


@flow(log_prints=True)
def get_color(name: str, index: int):
    color = get_colors((name, index))
    print(f"Color {name=} and {index=} is '{color}'")
