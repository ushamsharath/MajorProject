from flask import Flask, request, jsonify
from ultralytics import YOLO
import cv2
import tempfile
import os

app = Flask(__name__)

def count_people(video_path):
    model = YOLO("yolov8n.pt")  # Use nano for speed, or yolov8s.pt for more accuracy
    cap = cv2.VideoCapture(video_path)
    frame_counts = []
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        results = model(frame)
        people = [det for det in results[0].boxes.data.tolist() if int(det[5]) == 0]  # class 0 = person
        frame_counts.append(len(people))
    cap.release()
    return frame_counts

@app.route('/analyze', methods=['POST'])
def analyze():
    video = request.files['video']
    with tempfile.NamedTemporaryFile(delete=False, suffix='.mp4') as tmp:
        video.save(tmp.name)
        counts = count_people(tmp.name)
        os.unlink(tmp.name)
    return jsonify({
        "frame_counts": counts,
        "max_count": max(counts) if counts else 0,
        "avg_count": int(sum(counts)/len(counts)) if counts else 0
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
