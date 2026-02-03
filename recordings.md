---
layout: default
title: Terminal Recordings
---

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/asciinema-player@3.6.3/dist/bundle/asciinema-player.css" />
<script src="https://cdn.jsdelivr.net/npm/asciinema-player@3.6.3/dist/bundle/asciinema-player.min.js"></script>

<style>
.recording-container {
  margin-bottom: 40px;
}
.recording-container h3 {
  margin-bottom: 10px;
}
.recording-container p {
  color: #666;
  margin-bottom: 15px;
}
.asciinema-player-wrapper {
  max-width: 100%;
}
.speed-control {
  margin-bottom: 10px;
}
.speed-control label {
  margin-right: 8px;
}
.speed-control select {
  padding: 4px 8px;
  font-size: 14px;
}
</style>

This page contains asciinema terminal recordings. To add a new recording:

1. Record with: `asciinema rec filename.cast`
2. Place the `.cast` file in `/assets/recordings/`
3. Add a new section below

---

<!-- Example recording (uncomment and modify when you have a recording):

<div class="recording-container">
  <h3>Example Recording</h3>
  <p>Description of what this recording demonstrates.</p>
  <div id="demo1"></div>
</div>

-->

<div id="recordings-list"></div>

{% raw %}
<script>
// Configuration: Add your recordings here
const recordings = [
  {
    id: 'plan-ice',
    file: '/assets/recordings/plan_ICE.cast',
    title: 'Planning ICE Estimation',
    description: 'Planning session for ICE estimation analysis.',
    options: {
      theme: 'asciinema',
      fit: 'width',
      idleTimeLimit: 2
    }
  },
  {
    id: 'estimate-ice',
    file: '/assets/recordings/estimate_ICE.cast',
    title: 'Estimating ICE',
    description: 'Running the ICE estimation analysis.',
    options: {
      theme: 'asciinema',
      fit: 'width',
      idleTimeLimit: 2
    }
  }
];

// Render recordings
document.addEventListener('DOMContentLoaded', function() {
  const container = document.getElementById('recordings-list');

  recordings.forEach(rec => {
    // Create container elements
    const wrapper = document.createElement('div');
    wrapper.className = 'recording-container';

    const title = document.createElement('h3');
    title.textContent = rec.title;
    wrapper.appendChild(title);

    if (rec.description) {
      const desc = document.createElement('p');
      desc.textContent = rec.description;
      wrapper.appendChild(desc);
    }

    // Speed control
    const speedControl = document.createElement('div');
    speedControl.className = 'speed-control';
    const speedLabel = document.createElement('label');
    speedLabel.textContent = 'Speed: ';
    speedLabel.htmlFor = rec.id + '-speed';
    const speedSelect = document.createElement('select');
    speedSelect.id = rec.id + '-speed';
    [0.5, 1, 1.5, 2, 3].forEach(s => {
      const opt = document.createElement('option');
      opt.value = s;
      opt.textContent = s + 'x';
      if (s === (rec.options?.speed || 1)) opt.selected = true;
      speedSelect.appendChild(opt);
    });
    speedControl.appendChild(speedLabel);
    speedControl.appendChild(speedSelect);
    wrapper.appendChild(speedControl);

    const playerDiv = document.createElement('div');
    playerDiv.id = rec.id;
    wrapper.appendChild(playerDiv);

    container.appendChild(wrapper);

    // Initialize player
    const player = AsciinemaPlayer.create(rec.file, playerDiv, rec.options || {});

    // Wire up speed control
    speedSelect.addEventListener('change', function() {
      player.setSpeed(parseFloat(this.value));
    });
  });

  if (recordings.length === 0) {
    container.innerHTML = '<p><em>No recordings yet. Add your first recording by following the instructions above.</em></p>';
  }
});
</script>
{% endraw %}
