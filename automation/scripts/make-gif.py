import sys
from pathlib import Path
from PIL import Image


def main() -> None:
    if len(sys.argv) < 3:
        raise SystemExit("Usage: python make-gif.py <frames_dir> <output_gif> [duration_ms]")

    frames_dir = Path(sys.argv[1])
    output_gif = Path(sys.argv[2])
    duration = int(sys.argv[3]) if len(sys.argv) > 3 else 700

    frame_paths = sorted(frames_dir.glob("*.png"))
    if not frame_paths:
        raise SystemExit("No PNG frames found.")

    images = [Image.open(frame).convert("P", palette=Image.ADAPTIVE) for frame in frame_paths]
    output_gif.parent.mkdir(parents=True, exist_ok=True)
    images[0].save(
        output_gif,
        save_all=True,
        append_images=images[1:],
        optimize=False,
        duration=duration,
        loop=0,
    )


if __name__ == "__main__":
    main()
