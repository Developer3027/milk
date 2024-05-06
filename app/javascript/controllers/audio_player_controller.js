import { Controller } from "@hotwired/stimulus";
import WaveSurfer from "wavesurfer.js";

// Connects to data-controller="audio-player"
export default class extends Controller {
  static values = { url: String };
  static targets = ["preview", "timeEl", "durationEl"];

  connect() {
    const audio = new Audio();
    audio.src = this.urlValue;

    this.wavesurfer = WaveSurfer.create({
      container: this.previewTarget,
      waveColor: "#00B1D1",
      progressColor: "#01DFB6",
      url: this.urlValue,
      height: "50",
      dragToSeek: true,
      barWidth: 2,
    });
    this.wavesurfer.on('decode', (duration) => {
      this.durationElTarget.textContent = this.formatTime(duration);
    });
    this.wavesurfer.on('timeupdate', (currentTime) => {
      this.timeElTarget.textContent = this.formatTime(currentTime);
    });
  }

  formatTime = (seconds) => {
    const minutes = Math.floor(seconds / 60)
    const secondsRemainder = Math.round(seconds) % 60
    const paddedSeconds = `0${secondsRemainder}`.slice(-2)
    return `${minutes}:${paddedSeconds}`
  }

  togglePlaying(e) {
    e.preventDefault();
    this.wavesurfer.playPause();
    let link = e.target.closest("a");
    Array.from(link.children).forEach((child) =>
      child.classList.toggle("hidden")
    );
  }
}


