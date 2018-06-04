import React from 'react';

const MemoryMenuItem = ({memory}) => (
  <div className="">
    <img
      alt={memory.title}
      src={memory.photo_url}
      style={{
        height: '50px',
        marginRight: '10px',
        width: '50px',
      }}
    />
    <div>
      <div>{memory.title}</div>
    </div>
  </div>
);

export default MemoryMenuItem;
