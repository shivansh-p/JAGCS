#include "mission_item.h"

// Qt
#include <QDebug>

// Internal
#include "mission.h"

using namespace dao;

int MissionItem::missionId() const
{
    return m_missionId;
}

void MissionItem::setMissionId(int missionId)
{
    m_missionId = missionId;
}

int MissionItem::sequence() const
{
    return m_sequence;
}

void MissionItem::setSequence(int sequence)
{
    m_sequence = sequence;
}

MissionItem::Command MissionItem::command() const
{
    return m_command;
}

void MissionItem::setCommand(Command command)
{
    m_command = command;
}

float MissionItem::altitude() const
{
    return m_altitude;
}

void MissionItem::setAltitude(float altitude)
{
    m_altitude = altitude;
}

bool MissionItem::isAltitudeRelative() const
{
    return m_altitudeRelative;
}

void MissionItem::setAltitudeRelative(bool altitudeRelative)
{
    m_altitudeRelative = altitudeRelative;
}

double MissionItem::latitude() const
{
    return m_latitude;
}

void MissionItem::setLatitude(double latitude)
{
    m_latitude = latitude;
}

double MissionItem::longitude() const
{
    return m_longitude;
}

void MissionItem::setLongitude(double longitude)
{
    m_longitude = longitude;
}

float MissionItem::radius() const
{
    return m_radius;
}

void MissionItem::setRadius(float radius)
{
    m_radius = radius;
}

float MissionItem::pitch() const
{
    return m_pitch;
}

void MissionItem::setPitch(float pitch)
{
    m_pitch = pitch;
}

int MissionItem::periods() const
{
    return m_periods;
}

void MissionItem::setPeriods(int periods)
{
    m_periods = periods;
}

MissionItem::Status MissionItem::status() const
{
    return m_status;
}

void MissionItem::setStatus(Status status)
{
    m_status = status;
}

bool MissionItem::isReached() const
{
    return m_reached;
}

void MissionItem::setReached(bool reached)
{
    m_reached = reached;
}

bool MissionItem::isCurrent() const
{
    return m_current;
}

void MissionItem::setCurrent(bool current)
{
    m_current = current;
}
